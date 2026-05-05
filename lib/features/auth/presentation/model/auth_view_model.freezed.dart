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
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

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
    bool isLoading,
    bool isAuthenticated,
    String? error,
    String? userId,
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
    Object? isLoading = null,
    Object? isAuthenticated = null,
    Object? error = freezed,
    Object? userId = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isAuthenticated: null == isAuthenticated
                ? _value.isAuthenticated
                : isAuthenticated // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
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
    bool isLoading,
    bool isAuthenticated,
    String? error,
    String? userId,
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
    Object? isLoading = null,
    Object? isAuthenticated = null,
    Object? error = freezed,
    Object? userId = freezed,
  }) {
    return _then(
      _$AuthViewModelImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isAuthenticated: null == isAuthenticated
            ? _value.isAuthenticated
            : isAuthenticated // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AuthViewModelImpl implements _AuthViewModel {
  const _$AuthViewModelImpl({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.error,
    this.userId,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isAuthenticated;
  @override
  final String? error;
  @override
  final String? userId;

  @override
  String toString() {
    return 'AuthViewModel(isLoading: $isLoading, isAuthenticated: $isAuthenticated, error: $error, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthViewModelImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, isAuthenticated, error, userId);

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthViewModelImplCopyWith<_$AuthViewModelImpl> get copyWith =>
      __$$AuthViewModelImplCopyWithImpl<_$AuthViewModelImpl>(this, _$identity);
}

abstract class _AuthViewModel implements AuthViewModel {
  const factory _AuthViewModel({
    final bool isLoading,
    final bool isAuthenticated,
    final String? error,
    final String? userId,
  }) = _$AuthViewModelImpl;

  @override
  bool get isLoading;
  @override
  bool get isAuthenticated;
  @override
  String? get error;
  @override
  String? get userId;

  /// Create a copy of AuthViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthViewModelImplCopyWith<_$AuthViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
