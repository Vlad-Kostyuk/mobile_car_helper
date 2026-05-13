import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/auth_user.dart';

part 'auth_view_model.freezed.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

@freezed
class AuthViewModel with _$AuthViewModel {
  const factory AuthViewModel({
    @Default(AuthStatus.initial) AuthStatus status,
    AuthUser? user,
    String? error,
    @Default(false) bool resetEmailSent,
  }) = _AuthViewModel;

  const AuthViewModel._();

  bool get isLoading => status == AuthStatus.loading;
  bool get isAuthenticated => status == AuthStatus.authenticated;
}
