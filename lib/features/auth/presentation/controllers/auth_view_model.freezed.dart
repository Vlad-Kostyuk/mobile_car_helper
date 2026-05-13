// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthViewModel {
  AuthStatus get status => throw _privateConstructorUsedError;
  AuthUser? get user => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get resetEmailSent => throw _privateConstructorUsedError;

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthViewModelCopyWith<AuthViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewModelCopyWith<$Res> {
  factory $AuthViewModelCopyWith(
    AuthViewModel value,
    $Res Function(AuthViewModel) then,
  ) = _$AuthViewModelCopyWithImpl<$Res, AuthViewModel>;
  @useResult
  $Res call({
    AuthStatus status,
    AuthUser? user,
    String? error,
    bool resetEmailSent,
  });
}

/// @nodoc
class _$AuthViewModelCopyWithImpl<$Res, $Val extends AuthViewModel>
    implements $AuthViewModelCopyWith<$Res> {
  _$AuthViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? error = freezed,
    Object? resetEmailSent = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as AuthStatus,
            user: freezed == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as AuthUser?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            resetEmailSent: null == resetEmailSent
                ? _value.resetEmailSent
                : resetEmailSent // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthViewModelImplCopyWith<$Res>
    implements $AuthViewModelCopyWith<$Res> {
  factory _$$AuthViewModelImplCopyWith(
    _$AuthViewModelImpl value,
    $Res Function(_$AuthViewModelImpl) then,
  ) = __$$AuthViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AuthStatus status,
    AuthUser? user,
    String? error,
    bool resetEmailSent,
  });
}

/// @nodoc
class __$$AuthViewModelImplCopyWithImpl<$Res>
    extends _$AuthViewModelCopyWithImpl<$Res, _$AuthViewModelImpl>
    implements _$$AuthViewModelImplCopyWith<$Res> {
  __$$AuthViewModelImplCopyWithImpl(
    _$AuthViewModelImpl _value,
    $Res Function(_$AuthViewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = freezed,
    Object? error = freezed,
    Object? resetEmailSent = null,
  }) {
    return _then(
      _$AuthViewModelImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as AuthStatus,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as AuthUser?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        resetEmailSent: null == resetEmailSent
            ? _value.resetEmailSent
            : resetEmailSent // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
class _$AuthViewModelImpl extends _AuthViewModel {
  const _$AuthViewModelImpl({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
    this.resetEmailSent = false,
  }) : super._();

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  final AuthUser? user;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool resetEmailSent;

  @override
  String toString() {
    return 'AuthViewModel(status: $status, user: $user, error: $error, resetEmailSent: $resetEmailSent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthViewModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.resetEmailSent, resetEmailSent) ||
                other.resetEmailSent == resetEmailSent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, user, error, resetEmailSent);

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthViewModelImplCopyWith<_$AuthViewModelImpl> get copyWith =>
      __$$AuthViewModelImplCopyWithImpl<_$AuthViewModelImpl>(this, _$identity);
}

abstract class _AuthViewModel extends AuthViewModel {
  const factory _AuthViewModel({
    final AuthStatus status,
    final AuthUser? user,
    final String? error,
    final bool resetEmailSent,
  }) = _$AuthViewModelImpl;
  const _AuthViewModel._() : super._();

  @override
  AuthStatus get status;
  @override
  AuthUser? get user;
  @override
  String? get error;
  @override
  bool get resetEmailSent;

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthViewModelImplCopyWith<_$AuthViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
