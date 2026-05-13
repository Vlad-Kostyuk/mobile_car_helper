import 'dart:io';

import 'package:injectable/injectable.dart';
// Hide supabase's own AuthUser to avoid name conflict with our domain model
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;

import '../../../../shared/base_domain/either.dart';
import '../../../../shared/base_domain/failure.dart';
import '../../domain/models/auth_user.dart';
import '../../domain/services/auth_repository.dart';
import '../data_sources/remote/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  }) => _wrap(() => _dataSource.signInWithEmail(email: email, password: password));

  @override
  Future<Either<Failure, AuthUser>> signInWithGoogle() =>
      _wrap(_dataSource.signInWithGoogle);

  @override
  Future<Either<Failure, AuthUser>> signUp({
    required String email,
    required String password,
    String? displayName,
  }) => _wrap(
        () => _dataSource.signUp(
          email: email,
          password: password,
          displayName: displayName,
        ),
      );

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _dataSource.signOut();
      return const Right(null);
    } catch (_) {
      return const Right(null); // offline-first sign-out — always succeed locally
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) async {
    try {
      await _dataSource.resetPassword(email);
      return const Right(null);
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } on SocketException {
      return const Left(Failure.network('Немає підключення до інтернету'));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }

  @override
  AuthUser? get currentUser => _dataSource.currentUser;

  @override
  Stream<AuthUser?> get authStateChanges => _dataSource.authStateChanges;

  Future<Either<Failure, T>> _wrap<T>(Future<T> Function() call) async {
    try {
      return Right(await call());
    } on AuthException catch (e) {
      return Left(Failure.auth(e.message));
    } on SocketException {
      return const Left(Failure.network('Немає підключення до інтернету'));
    } catch (e) {
      return Left(Failure.unknown(e.toString()));
    }
  }
}
