import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/repository/auth_repository.dart';
import './model/auth_view_model.dart';

@injectable
class AuthCubit extends Cubit<AuthViewModel> {
  AuthCubit(this._repository) : super(const AuthViewModel());

  final AuthRepository _repository;

  Future<void> signInWithEmail({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.signInWithEmail(email: email, password: password);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: f.when(
        network: (m) => m, cache: (m) => m, auth: (m) => m,
        notFound: (m) => m, unknown: (m) => m,
      ))),
      (user) => emit(state.copyWith(isLoading: false, isAuthenticated: true, userId: user.id)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.signInWithGoogle();
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: f.when(
        network: (m) => m, cache: (m) => m, auth: (m) => m,
        notFound: (m) => m, unknown: (m) => m,
      ))),
      (user) => emit(state.copyWith(isLoading: false, isAuthenticated: true, userId: user.id)),
    );
  }

  Future<void> signOut() async {
    await _repository.signOut();
    emit(const AuthViewModel());
  }
}
