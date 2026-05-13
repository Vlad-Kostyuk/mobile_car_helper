import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/user_profile.dart';

part 'profile_view_model.freezed.dart';

@freezed
class ProfileViewModel with _$ProfileViewModel {
  const factory ProfileViewModel({
    @Default(false) bool isLoading,
    UserProfile? profile,
    String? error,
  }) = _ProfileViewModel;

  factory ProfileViewModel.initial() => const ProfileViewModel();
}
