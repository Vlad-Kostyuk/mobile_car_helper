import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_view_model.freezed.dart';

@freezed
class AuthViewModel with _$AuthViewModel {
  const factory AuthViewModel({
    @Default(false) bool isLoading,
    @Default(false) bool isAuthenticated,
    String? error,
    String? userId,
  }) = _AuthViewModel;

  factory AuthViewModel.initial() => const AuthViewModel();
}
