// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CalendarViewModel {
  bool get isLoading => throw _privateConstructorUsedError;
  DateTime? get focusedDay => throw _privateConstructorUsedError;
  DateTime? get selectedDay => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of CalendarViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarViewModelCopyWith<CalendarViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarViewModelCopyWith<$Res> {
  factory $CalendarViewModelCopyWith(
    CalendarViewModel value,
    $Res Function(CalendarViewModel) then,
  ) = _$CalendarViewModelCopyWithImpl<$Res, CalendarViewModel>;
  @useResult
  $Res call({
    bool isLoading,
    DateTime? focusedDay,
    DateTime? selectedDay,
    String? error,
  });
}

/// @nodoc
class _$CalendarViewModelCopyWithImpl<$Res, $Val extends CalendarViewModel>
    implements $CalendarViewModelCopyWith<$Res> {
  _$CalendarViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? focusedDay = freezed,
    Object? selectedDay = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            focusedDay: freezed == focusedDay
                ? _value.focusedDay
                : focusedDay // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            selectedDay: freezed == selectedDay
                ? _value.selectedDay
                : selectedDay // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
abstract class _$$CalendarViewModelImplCopyWith<$Res>
    implements $CalendarViewModelCopyWith<$Res> {
  factory _$$CalendarViewModelImplCopyWith(
    _$CalendarViewModelImpl value,
    $Res Function(_$CalendarViewModelImpl) then,
  ) = __$$CalendarViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    DateTime? focusedDay,
    DateTime? selectedDay,
    String? error,
  });
}

/// @nodoc
class __$$CalendarViewModelImplCopyWithImpl<$Res>
    extends _$CalendarViewModelCopyWithImpl<$Res, _$CalendarViewModelImpl>
    implements _$$CalendarViewModelImplCopyWith<$Res> {
  __$$CalendarViewModelImplCopyWithImpl(
    _$CalendarViewModelImpl _value,
    $Res Function(_$CalendarViewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CalendarViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? focusedDay = freezed,
    Object? selectedDay = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$CalendarViewModelImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        focusedDay: freezed == focusedDay
            ? _value.focusedDay
            : focusedDay // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        selectedDay: freezed == selectedDay
            ? _value.selectedDay
            : selectedDay // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CalendarViewModelImpl implements _CalendarViewModel {
  const _$CalendarViewModelImpl({
    this.isLoading = false,
    this.focusedDay,
    this.selectedDay,
    this.error,
  });

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DateTime? focusedDay;
  @override
  final DateTime? selectedDay;
  @override
  final String? error;

  @override
  String toString() {
    return 'CalendarViewModel(isLoading: $isLoading, focusedDay: $focusedDay, selectedDay: $selectedDay, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarViewModelImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, focusedDay, selectedDay, error);

  /// Create a copy of CalendarViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarViewModelImplCopyWith<_$CalendarViewModelImpl> get copyWith =>
      __$$CalendarViewModelImplCopyWithImpl<_$CalendarViewModelImpl>(
        this,
        _$identity,
      );
}

abstract class _CalendarViewModel implements CalendarViewModel {
  const factory _CalendarViewModel({
    final bool isLoading,
    final DateTime? focusedDay,
    final DateTime? selectedDay,
    final String? error,
  }) = _$CalendarViewModelImpl;

  @override
  bool get isLoading;
  @override
  DateTime? get focusedDay;
  @override
  DateTime? get selectedDay;
  @override
  String? get error;

  /// Create a copy of CalendarViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarViewModelImplCopyWith<_$CalendarViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
