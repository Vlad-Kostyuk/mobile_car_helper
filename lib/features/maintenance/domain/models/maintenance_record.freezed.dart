// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MaintenanceRecord {
  String get id => throw _privateConstructorUsedError;
  String get workId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  DateTime get performedAt => throw _privateConstructorUsedError;
  int get mileageAtService => throw _privateConstructorUsedError;
  String? get serviceLocation => throw _privateConstructorUsedError;
  double? get cost => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String> get photoUrls => throw _privateConstructorUsedError;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaintenanceRecordCopyWith<MaintenanceRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaintenanceRecordCopyWith<$Res> {
  factory $MaintenanceRecordCopyWith(
    MaintenanceRecord value,
    $Res Function(MaintenanceRecord) then,
  ) = _$MaintenanceRecordCopyWithImpl<$Res, MaintenanceRecord>;
  @useResult
  $Res call({
    String id,
    String workId,
    String vehicleId,
    DateTime performedAt,
    int mileageAtService,
    String? serviceLocation,
    double? cost,
    String? notes,
    List<String> photoUrls,
  });
}

/// @nodoc
class _$MaintenanceRecordCopyWithImpl<$Res, $Val extends MaintenanceRecord>
    implements $MaintenanceRecordCopyWith<$Res> {
  _$MaintenanceRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workId = null,
    Object? vehicleId = null,
    Object? performedAt = null,
    Object? mileageAtService = null,
    Object? serviceLocation = freezed,
    Object? cost = freezed,
    Object? notes = freezed,
    Object? photoUrls = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            workId: null == workId
                ? _value.workId
                : workId // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            performedAt: null == performedAt
                ? _value.performedAt
                : performedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            mileageAtService: null == mileageAtService
                ? _value.mileageAtService
                : mileageAtService // ignore: cast_nullable_to_non_nullable
                      as int,
            serviceLocation: freezed == serviceLocation
                ? _value.serviceLocation
                : serviceLocation // ignore: cast_nullable_to_non_nullable
                      as String?,
            cost: freezed == cost
                ? _value.cost
                : cost // ignore: cast_nullable_to_non_nullable
                      as double?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoUrls: null == photoUrls
                ? _value.photoUrls
                : photoUrls // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MaintenanceRecordImplCopyWith<$Res>
    implements $MaintenanceRecordCopyWith<$Res> {
  factory _$$MaintenanceRecordImplCopyWith(
    _$MaintenanceRecordImpl value,
    $Res Function(_$MaintenanceRecordImpl) then,
  ) = __$$MaintenanceRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String workId,
    String vehicleId,
    DateTime performedAt,
    int mileageAtService,
    String? serviceLocation,
    double? cost,
    String? notes,
    List<String> photoUrls,
  });
}

/// @nodoc
class __$$MaintenanceRecordImplCopyWithImpl<$Res>
    extends _$MaintenanceRecordCopyWithImpl<$Res, _$MaintenanceRecordImpl>
    implements _$$MaintenanceRecordImplCopyWith<$Res> {
  __$$MaintenanceRecordImplCopyWithImpl(
    _$MaintenanceRecordImpl _value,
    $Res Function(_$MaintenanceRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workId = null,
    Object? vehicleId = null,
    Object? performedAt = null,
    Object? mileageAtService = null,
    Object? serviceLocation = freezed,
    Object? cost = freezed,
    Object? notes = freezed,
    Object? photoUrls = null,
  }) {
    return _then(
      _$MaintenanceRecordImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        workId: null == workId
            ? _value.workId
            : workId // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        performedAt: null == performedAt
            ? _value.performedAt
            : performedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        mileageAtService: null == mileageAtService
            ? _value.mileageAtService
            : mileageAtService // ignore: cast_nullable_to_non_nullable
                  as int,
        serviceLocation: freezed == serviceLocation
            ? _value.serviceLocation
            : serviceLocation // ignore: cast_nullable_to_non_nullable
                  as String?,
        cost: freezed == cost
            ? _value.cost
            : cost // ignore: cast_nullable_to_non_nullable
                  as double?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrls: null == photoUrls
            ? _value._photoUrls
            : photoUrls // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$MaintenanceRecordImpl implements _MaintenanceRecord {
  const _$MaintenanceRecordImpl({
    required this.id,
    required this.workId,
    required this.vehicleId,
    required this.performedAt,
    required this.mileageAtService,
    this.serviceLocation,
    this.cost,
    this.notes,
    final List<String> photoUrls = const [],
  }) : _photoUrls = photoUrls;

  @override
  final String id;
  @override
  final String workId;
  @override
  final String vehicleId;
  @override
  final DateTime performedAt;
  @override
  final int mileageAtService;
  @override
  final String? serviceLocation;
  @override
  final double? cost;
  @override
  final String? notes;
  final List<String> _photoUrls;
  @override
  @JsonKey()
  List<String> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

  @override
  String toString() {
    return 'MaintenanceRecord(id: $id, workId: $workId, vehicleId: $vehicleId, performedAt: $performedAt, mileageAtService: $mileageAtService, serviceLocation: $serviceLocation, cost: $cost, notes: $notes, photoUrls: $photoUrls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaintenanceRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workId, workId) || other.workId == workId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.performedAt, performedAt) ||
                other.performedAt == performedAt) &&
            (identical(other.mileageAtService, mileageAtService) ||
                other.mileageAtService == mileageAtService) &&
            (identical(other.serviceLocation, serviceLocation) ||
                other.serviceLocation == serviceLocation) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(
              other._photoUrls,
              _photoUrls,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    workId,
    vehicleId,
    performedAt,
    mileageAtService,
    serviceLocation,
    cost,
    notes,
    const DeepCollectionEquality().hash(_photoUrls),
  );

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaintenanceRecordImplCopyWith<_$MaintenanceRecordImpl> get copyWith =>
      __$$MaintenanceRecordImplCopyWithImpl<_$MaintenanceRecordImpl>(
        this,
        _$identity,
      );
}

abstract class _MaintenanceRecord implements MaintenanceRecord {
  const factory _MaintenanceRecord({
    required final String id,
    required final String workId,
    required final String vehicleId,
    required final DateTime performedAt,
    required final int mileageAtService,
    final String? serviceLocation,
    final double? cost,
    final String? notes,
    final List<String> photoUrls,
  }) = _$MaintenanceRecordImpl;

  @override
  String get id;
  @override
  String get workId;
  @override
  String get vehicleId;
  @override
  DateTime get performedAt;
  @override
  int get mileageAtService;
  @override
  String? get serviceLocation;
  @override
  double? get cost;
  @override
  String? get notes;
  @override
  List<String> get photoUrls;

  /// Create a copy of MaintenanceRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaintenanceRecordImplCopyWith<_$MaintenanceRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
