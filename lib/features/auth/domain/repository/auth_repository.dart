import '../../../../core/error/either.dart';
import '../../../../core/error/failure.dart';
import '../model/auth_user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, AuthUser>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, AuthUser>> signInWithGoogle();
  Future<Either<Failure, AuthUser>> signUp({
    required String email,
    required String password,
    String? displayName,
  });
  Future<Either<Failure, void>> signOut();
  Future<Either<Failure, void>> resetPassword(String email);
  AuthUser? get currentUser;
  Stream<AuthUser?> get authStateChanges;
}
