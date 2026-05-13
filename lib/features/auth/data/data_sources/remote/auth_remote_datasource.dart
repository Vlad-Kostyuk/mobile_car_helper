import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
// Hide supabase's own AuthUser to avoid name conflict with our domain model
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;

import '../../../domain/models/auth_user.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthUser> signInWithEmail({
    required String email,
    required String password,
  });
  Future<AuthUser> signInWithGoogle();
  Future<AuthUser> signUp({
    required String email,
    required String password,
    String? displayName,
  });
  Future<void> signOut();
  Future<void> resetPassword(String email);
  AuthUser? get currentUser;
  Stream<AuthUser?> get authStateChanges;
}

@LazySingleton(as: AuthRemoteDataSource)
class SupabaseAuthDataSource implements AuthRemoteDataSource {
  SupabaseAuthDataSource(this._client, this._googleSignIn);

  final SupabaseClient _client;
  final GoogleSignIn _googleSignIn;

  GoTrueClient get _auth => _client.auth;

  @override
  Future<AuthUser> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await _auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response.user!.toDomain();
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    // User cancelled — treat as silent failure
    if (googleUser == null) throw const AuthException('sign_in_cancelled');

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    if (idToken == null) throw const AuthException('Google idToken is null');

    final response = await _auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: googleAuth.accessToken,
    );
    return response.user!.toDomain();
  }

  @override
  Future<AuthUser> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final response = await _auth.signUp(
      email: email,
      password: password,
      data: displayName != null ? {'full_name': displayName} : null,
    );
    return response.user!.toDomain();
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Future<void> resetPassword(String email) =>
      _auth.resetPasswordForEmail(email);

  @override
  AuthUser? get currentUser => _auth.currentUser?.toDomain();

  @override
  Stream<AuthUser?> get authStateChanges => _auth.onAuthStateChange
      .map((event) => event.session?.user.toDomain());
}

extension on User {
  AuthUser toDomain() => AuthUser(
        id: id,
        email: email ?? '',
        displayName: userMetadata?['full_name'] as String?,
        avatarUrl: userMetadata?['avatar_url'] as String?,
      );
}
