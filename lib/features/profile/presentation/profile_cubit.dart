import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../auth/domain/model/auth_user.dart';
import '../domain/model/user_profile.dart';
import '../domain/repository/profile_repository.dart';
import 'model/profile_view_model.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileViewModel> {
  ProfileCubit(this._repository) : super(const ProfileViewModel());

  final ProfileRepository _repository;

  Future<void> load(String userId, {AuthUser? fallback}) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.fetchProfile(userId);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: f.toString())),
      (profile) {
        if (profile != null) {
          emit(state.copyWith(isLoading: false, profile: profile));
        } else if (fallback != null) {
          // profiles row doesn't exist yet — use auth metadata as fallback
          emit(state.copyWith(
            isLoading: false,
            profile: UserProfile(
              id: fallback.id,
              email: fallback.email,
              displayName: fallback.displayName,
              avatarUrl: fallback.avatarUrl,
            ),
          ));
        } else {
          emit(state.copyWith(isLoading: false));
        }
      },
    );
  }

  Future<void> updateProfile(UserProfile profile) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.updateProfile(profile);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: f.toString())),
      (updated) => emit(state.copyWith(isLoading: false, profile: updated)),
    );
  }

  void clear() => emit(const ProfileViewModel());
}
