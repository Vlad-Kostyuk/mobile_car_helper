// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicles_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VehiclesViewModel {
  List<Vehicle> get vehicles => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  String? get activeVehicleId => throw _privateConstructorUsedError;

  /// Create a copy of VehiclesViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehiclesViewModelCopyWith<VehiclesViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehiclesViewModelCopyWith<$Res> {
  factory $VehiclesViewModelCopyWith(
    VehiclesViewModel value,
    $Res Function(VehiclesViewModel) then,
  ) = _$VehiclesViewModelCopyWithImpl<$Res, VehiclesViewModel>;
  @useResult
  $Res call({
    List<Vehicle> vehicles,
    bool isLoading,
    String? error,
    String? activeVehicleId,
  });
}

/// @nodoc
class _$VehiclesViewModelCopyWithImpl<$Res, $Val extends VehiclesViewModel>
    implements $VehiclesViewModelCopyWith<$Res> {
  _$VehiclesViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehiclesViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicles = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? activeVehicleId = freezed,
  }) {
    return _then(
      _value.copyWith(
            vehicles: null == vehicles
                ? _value.vehicles
                : vehicles // ignore: cast_nullable_to_non_nullable
                      as List<Vehicle>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            activeVehicleId: freezed == activeVehicleId
                ? _value.activeVehicleId
                : activeVehicleId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehiclesViewModelImplCopyWith<$Res>
    implements $VehiclesViewModelCopyWith<$Res> {
  factory _$$VehiclesViewModelImplCopyWith(
    _$VehiclesViewModelImpl value,
    $Res Function(_$VehiclesViewModelImpl) then,
  ) = __$$VehiclesViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Vehicle> vehicles,
    bool isLoading,
    String? error,
    String? activeVehicleId,
  });
}

/// @nodoc
class __$$VehiclesViewModelImplCopyWithImpl<$Res>
    extends _$VehiclesViewModelCopyWithImpl<$Res, _$VehiclesViewModelImpl>
    implements _$$VehiclesViewModelImplCopyWith<$Res> {
  __$$VehiclesViewModelImplCopyWithImpl(
    _$VehiclesViewModelImpl _value,
    $Res Function(_$VehiclesViewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehiclesViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicles = null,
    Object? isLoading = null,
    Object? error = freezed,
    Object? activeVehicleId = freezed,
  }) {
    return _then(
      _$VehiclesViewModelImpl(
        vehicles: null == vehicles
            ? _value._vehicles
            : vehicles // ignore: cast_nullable_to_non_nullable
                  as List<Vehicle>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        activeVehicleId: freezed == activeVehicleId
            ? _value.activeVehicleId
            : activeVehicleId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$VehiclesViewModelImpl implements _VehiclesViewModel {
  const _$VehiclesViewModelImpl({
    final List<Vehicle> vehicles = const [],
    this.isLoading = false,
    this.error,
    this.activeVehicleId,
  }) : _vehicles = vehicles;

  final List<Vehicle> _vehicles;
  @override
  @JsonKey()
  List<Vehicle> get vehicles {
    if (_vehicles is EqualUnmodifiableListView) return _vehicles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicles);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  final String? activeVehicleId;

  @override
  String toString() {
    return 'VehiclesViewModel(vehicles: $vehicles, isLoading: $isLoading, error: $error, activeVehicleId: $activeVehicleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehiclesViewModelImpl &&
            const DeepCollectionEquality().equals(other._vehicles, _vehicles) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.activeVehicleId, activeVehicleId) ||
                other.activeVehicleId == activeVehicleId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_vehicles),
    isLoading,
    error,
    activeVehicleId,
  );

  /// Create a copy of VehiclesViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehiclesViewModelImplCopyWith<_$VehiclesViewModelImpl> get copyWith =>
      __$$VehiclesViewModelImplCopyWithImpl<_$VehiclesViewModelImpl>(
        this,
        _$identity,
      );
}

abstract class _VehiclesViewModel implements VehiclesViewModel {
  const factory _VehiclesViewModel({
    final List<Vehicle> vehicles,
    final bool isLoading,
    final String? error,
    final String? activeVehicleId,
  }) = _$VehiclesViewModelImpl;

  @override
  List<Vehicle> get vehicles;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  String? get activeVehicleId;

  /// Create a copy of VehiclesViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehiclesViewModelImplCopyWith<_$VehiclesViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
