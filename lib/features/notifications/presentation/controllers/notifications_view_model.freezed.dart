// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationsViewModel {
  List<NotificationItem> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsViewModelCopyWith<NotificationsViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsViewModelCopyWith<$Res> {
  factory $NotificationsViewModelCopyWith(
    NotificationsViewModel value,
    $Res Function(NotificationsViewModel) then,
  ) = _$NotificationsViewModelCopyWithImpl<$Res, NotificationsViewModel>;
  @useResult
  $Res call({List<NotificationItem> items, bool isLoading, String? error});
}

/// @nodoc
class _$NotificationsViewModelCopyWithImpl<
  $Res,
  $Val extends NotificationsViewModel
>
    implements $NotificationsViewModelCopyWith<$Res> {
  _$NotificationsViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<NotificationItem>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationsViewModelImplCopyWith<$Res>
    implements $NotificationsViewModelCopyWith<$Res> {
  factory _$$NotificationsViewModelImplCopyWith(
    _$NotificationsViewModelImpl value,
    $Res Function(_$NotificationsViewModelImpl) then,
  ) = __$$NotificationsViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NotificationItem> items, bool isLoading, String? error});
}

/// @nodoc
class __$$NotificationsViewModelImplCopyWithImpl<$Res>
    extends
        _$NotificationsViewModelCopyWithImpl<$Res, _$NotificationsViewModelImpl>
    implements _$$NotificationsViewModelImplCopyWith<$Res> {
  __$$NotificationsViewModelImplCopyWithImpl(
    _$NotificationsViewModelImpl _value,
    $Res Function(_$NotificationsViewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(
      _$NotificationsViewModelImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<NotificationItem>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$NotificationsViewModelImpl implements _NotificationsViewModel {
  const _$NotificationsViewModelImpl({
    final List<NotificationItem> items = const [],
    this.isLoading = false,
    this.error,
  }) : _items = items;

  final List<NotificationItem> _items;
  @override
  @JsonKey()
  List<NotificationItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'NotificationsViewModel(items: $items, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsViewModelImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    isLoading,
    error,
  );

  /// Create a copy of NotificationsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsViewModelImplCopyWith<_$NotificationsViewModelImpl>
  get copyWith =>
      __$$NotificationsViewModelImplCopyWithImpl<_$NotificationsViewModelImpl>(
        this,
        _$identity,
      );
}

abstract class _NotificationsViewModel implements NotificationsViewModel {
  const factory _NotificationsViewModel({
    final List<NotificationItem> items,
    final bool isLoading,
    final String? error,
  }) = _$NotificationsViewModelImpl;

  @override
  List<NotificationItem> get items;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of NotificationsViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsViewModelImplCopyWith<_$NotificationsViewModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
