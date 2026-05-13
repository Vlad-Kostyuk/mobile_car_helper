import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:car_helper/shared/base_domain/failure.dart';
import '../../domain/models/auth_error_keys.dart';
import '../../domain/services/auth_repository.dart';
import './auth_view_model.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthViewModel> {
  AuthCubit(this._repository) : super(const AuthViewModel());

  final AuthRepository _repository;
  StreamSubscription<dynamic>? _authSub;

  /// Called once on app start from CarMaintenanceApp.initState().
  /// Checks current session synchronously, then subscribes to stream changes.
  Future<void> initialize() async {
    await checkAuthStatus();
    _authSub?.cancel();
    _authSub = _repository.authStateChanges.listen((user) {
      if (isClosed) return;
      if (user != null) {
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
          error: null,
        ));
      } else {
        // Only emit unauthenticated if we were previously authenticated
        // to avoid overwriting the initial state during startup
        if (state.status == AuthStatus.authenticated) {
          emit(state.copyWith(
            status: AuthStatus.unauthenticated,
            user: null,
          ));
        }
      }
    });
  }

  /// Checks currentSession synchronously — safe to call before stream emits.
  Future<void> checkAuthStatus() async {
    final user = _repository.currentUser;
    if (user != null) {
      emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    } else {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    final result = await _repository.signInWithEmail(
      email: email,
      password: password,
    );
    result.fold(
      (f) => emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        error: _mapFailure(f),
      )),
      (user) => emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      )),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    final result = await _repository.signInWithGoogle();
    result.fold(
      (f) {
        final msg = _mapFailure(f);
        // Silently dismiss Google sign-in cancellation
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
          error: msg.isEmpty ? null : msg,
        ));
      },
      (user) => emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      )),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    final result = await _repository.signUp(
      email: email,
      password: password,
      displayName: displayName,
    );
    result.fold(
      (f) => emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        error: _mapFailure(f),
      )),
      (user) => emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      )),
    );
  }

  Future<void> resetPassword(String email) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null, resetEmailSent: false));
    final result = await _repository.resetPassword(email);
    result.fold(
      (f) => emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        error: _mapFailure(f),
      )),
      (_) => emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        resetEmailSent: true,
      )),
    );
  }

  Future<void> signOut() async {
    await _repository.signOut();
    emit(const AuthViewModel(status: AuthStatus.unauthenticated));
  }

  void clearError() {
    if (state.error != null) {
      emit(state.copyWith(error: null));
    }
  }

  String _mapFailure(Failure failure) => failure.when(
        network: (_) => AuthErrorKeys.network,
        cache: (m) => m,
        auth: (String m) {
          if (m.contains('sign_in_cancelled')) return '';
          if (m.contains('Invalid login credentials') ||
              m.contains('invalid_credentials')) {
            return AuthErrorKeys.invalidCredentials;
          }
          if (m.contains('User already registered') ||
              m.contains('already registered')) {
            return AuthErrorKeys.alreadyRegistered;
          }
          if (m.contains('Email not confirmed')) {
            return AuthErrorKeys.emailNotConfirmed;
          }
          return m;
        },
        notFound: (m) => m,
        unknown: (_) => AuthErrorKeys.unknown,
      );

  @override
  Future<void> close() {
    _authSub?.cancel();
    return super.close();
  }
}
