import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

enum UnitSystem { km, miles }

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String email,
    String? displayName,
    String? lastName,
    String? avatarUrl,
    @Default(UnitSystem.km) UnitSystem unitSystem,
  }) = _UserProfile;
}
