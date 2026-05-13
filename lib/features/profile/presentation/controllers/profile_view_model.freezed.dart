// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileViewModel {
  bool get isLoading => throw _privateConstructorUsedError;
  UserProfile? get profile => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileViewModelCopyWith<ProfileViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileViewModelCopyWith<$Res> {
  factory $ProfileViewModelCopyWith(
    ProfileViewModel value,
    $Res Function(ProfileViewModel) then,
  ) = _$ProfileViewModelCopyWithImpl<$Res, ProfileViewModel>;
  @useResult
  $Res call({bool isLoading, UserProfile? profile, String? error});

  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$ProfileViewModelCopyWithImpl<$Res, $Val extends ProfileViewModel>
    implements $ProfileViewModelCopyWith<$Res> {
  _$ProfileViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profile = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as UserProfile?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileViewModelImplCopyWith<$Res>
    implements $ProfileViewModelCopyWith<$Res> {
  factory _$$ProfileViewModelImplCopyWith(
    _$ProfileViewModelImpl value,
    $Res Function(_$ProfileViewModelImpl) then,
  ) = __$$ProfileViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, UserProfile? profile, String? error});

  @override
  $UserProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$ProfileViewModelImplCopyWithImpl<$Res>
    extends _$ProfileViewModelCopyWithImpl<$Res, _$ProfileViewModelImpl>
    implements _$$ProfileViewModelImplCopyWith<$Res> {
  __$$ProfileViewModelImplCopyWithImpl(
    _$ProfileViewModelImpl _value,
    $Res Function(_$ProfileViewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? profile = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$ProfileViewModelImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ProfileViewModelImpl implements _ProfileViewModel {
  const _$ProfileViewModelImpl({
    this.isLoading = false,
    this.profile,
    this.error,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final UserProfile? profile;
  @override
  final String? error;

  @override
  String toString() {
    return 'ProfileViewModel(isLoading: $isLoading, profile: $profile, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileViewModelImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, profile, error);

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileViewModelImplCopyWith<_$ProfileViewModelImpl> get copyWith =>
      __$$ProfileViewModelImplCopyWithImpl<_$ProfileViewModelImpl>(
        this,
        _$identity,
      );
}

abstract class _ProfileViewModel implements ProfileViewModel {
  const factory _ProfileViewModel({
    final bool isLoading,
    final UserProfile? profile,
    final String? error,
  }) = _$ProfileViewModelImpl;

  @override
  bool get isLoading;
  @override
  UserProfile? get profile;
  @override
  String? get error;

  /// Create a copy of ProfileViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileViewModelImplCopyWith<_$ProfileViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
