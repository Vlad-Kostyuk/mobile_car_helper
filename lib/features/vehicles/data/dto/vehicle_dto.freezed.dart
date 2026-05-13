// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VehicleDto _$VehicleDtoFromJson(Map<String, dynamic> json) {
  return _VehicleDto.fromJson(json);
}

/// @nodoc
mixin _$VehicleDto {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  int get year => throw _privateConstructorUsedError;
  int get mileage => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  String? get vin => throw _privateConstructorUsedError;
  String? get plate => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_url')
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuel_type')
  String? get fuelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'engine_volume')
  double? get engineVolume => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  int? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VehicleDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleDtoCopyWith<VehicleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleDtoCopyWith<$Res> {
  factory $VehicleDtoCopyWith(
    VehicleDto value,
    $Res Function(VehicleDto) then,
  ) = _$VehicleDtoCopyWithImpl<$Res, VehicleDto>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    String brand,
    String model,
    int year,
    int mileage,
    String? nickname,
    String? vin,
    String? plate,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'fuel_type') String? fuelType,
    @JsonKey(name: 'engine_volume') double? engineVolume,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'updated_at') int? updatedAt,
  });
}

/// @nodoc
class _$VehicleDtoCopyWithImpl<$Res, $Val extends VehicleDto>
    implements $VehicleDtoCopyWith<$Res> {
  _$VehicleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? brand = null,
    Object? model = null,
    Object? year = null,
    Object? mileage = null,
    Object? nickname = freezed,
    Object? vin = freezed,
    Object? plate = freezed,
    Object? photoUrl = freezed,
    Object? fuelType = freezed,
    Object? engineVolume = freezed,
    Object? isActive = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            brand: null == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String,
            model: null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                      as String,
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            mileage: null == mileage
                ? _value.mileage
                : mileage // ignore: cast_nullable_to_non_nullable
                      as int,
            nickname: freezed == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String?,
            vin: freezed == vin
                ? _value.vin
                : vin // ignore: cast_nullable_to_non_nullable
                      as String?,
            plate: freezed == plate
                ? _value.plate
                : plate // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoUrl: freezed == photoUrl
                ? _value.photoUrl
                : photoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            fuelType: freezed == fuelType
                ? _value.fuelType
                : fuelType // ignore: cast_nullable_to_non_nullable
                      as String?,
            engineVolume: freezed == engineVolume
                ? _value.engineVolume
                : engineVolume // ignore: cast_nullable_to_non_nullable
                      as double?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VehicleDtoImplCopyWith<$Res>
    implements $VehicleDtoCopyWith<$Res> {
  factory _$$VehicleDtoImplCopyWith(
    _$VehicleDtoImpl value,
    $Res Function(_$VehicleDtoImpl) then,
  ) = __$$VehicleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    String brand,
    String model,
    int year,
    int mileage,
    String? nickname,
    String? vin,
    String? plate,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'fuel_type') String? fuelType,
    @JsonKey(name: 'engine_volume') double? engineVolume,
    @JsonKey(name: 'is_active') bool isActive,
    @JsonKey(name: 'updated_at') int? updatedAt,
  });
}

/// @nodoc
class __$$VehicleDtoImplCopyWithImpl<$Res>
    extends _$VehicleDtoCopyWithImpl<$Res, _$VehicleDtoImpl>
    implements _$$VehicleDtoImplCopyWith<$Res> {
  __$$VehicleDtoImplCopyWithImpl(
    _$VehicleDtoImpl _value,
    $Res Function(_$VehicleDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VehicleDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? brand = null,
    Object? model = null,
    Object? year = null,
    Object? mileage = null,
    Object? nickname = freezed,
    Object? vin = freezed,
    Object? plate = freezed,
    Object? photoUrl = freezed,
    Object? fuelType = freezed,
    Object? engineVolume = freezed,
    Object? isActive = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$VehicleDtoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        brand: null == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String,
        model: null == model
            ? _value.model
            : model // ignore: cast_nullable_to_non_nullable
                  as String,
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        mileage: null == mileage
            ? _value.mileage
            : mileage // ignore: cast_nullable_to_non_nullable
                  as int,
        nickname: freezed == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String?,
        vin: freezed == vin
            ? _value.vin
            : vin // ignore: cast_nullable_to_non_nullable
                  as String?,
        plate: freezed == plate
            ? _value.plate
            : plate // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoUrl: freezed == photoUrl
            ? _value.photoUrl
            : photoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        fuelType: freezed == fuelType
            ? _value.fuelType
            : fuelType // ignore: cast_nullable_to_non_nullable
                  as String?,
        engineVolume: freezed == engineVolume
            ? _value.engineVolume
            : engineVolume // ignore: cast_nullable_to_non_nullable
                  as double?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleDtoImpl implements _VehicleDto {
  const _$VehicleDtoImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    required this.brand,
    required this.model,
    required this.year,
    required this.mileage,
    this.nickname,
    this.vin,
    this.plate,
    @JsonKey(name: 'photo_url') this.photoUrl,
    @JsonKey(name: 'fuel_type') this.fuelType,
    @JsonKey(name: 'engine_volume') this.engineVolume,
    @JsonKey(name: 'is_active') this.isActive = false,
    @JsonKey(name: 'updated_at') this.updatedAt,
  });

  factory _$VehicleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleDtoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String brand;
  @override
  final String model;
  @override
  final int year;
  @override
  final int mileage;
  @override
  final String? nickname;
  @override
  final String? vin;
  @override
  final String? plate;
  @override
  @JsonKey(name: 'photo_url')
  final String? photoUrl;
  @override
  @JsonKey(name: 'fuel_type')
  final String? fuelType;
  @override
  @JsonKey(name: 'engine_volume')
  final double? engineVolume;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'updated_at')
  final int? updatedAt;

  @override
  String toString() {
    return 'VehicleDto(id: $id, userId: $userId, brand: $brand, model: $model, year: $year, mileage: $mileage, nickname: $nickname, vin: $vin, plate: $plate, photoUrl: $photoUrl, fuelType: $fuelType, engineVolume: $engineVolume, isActive: $isActive, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.vin, vin) || other.vin == vin) &&
            (identical(other.plate, plate) || other.plate == plate) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.engineVolume, engineVolume) ||
                other.engineVolume == engineVolume) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    brand,
    model,
    year,
    mileage,
    nickname,
    vin,
    plate,
    photoUrl,
    fuelType,
    engineVolume,
    isActive,
    updatedAt,
  );

  /// Create a copy of VehicleDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleDtoImplCopyWith<_$VehicleDtoImpl> get copyWith =>
      __$$VehicleDtoImplCopyWithImpl<_$VehicleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleDtoImplToJson(this);
  }
}

abstract class _VehicleDto implements VehicleDto {
  const factory _VehicleDto({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    required final String brand,
    required final String model,
    required final int year,
    required final int mileage,
    final String? nickname,
    final String? vin,
    final String? plate,
    @JsonKey(name: 'photo_url') final String? photoUrl,
    @JsonKey(name: 'fuel_type') final String? fuelType,
    @JsonKey(name: 'engine_volume') final double? engineVolume,
    @JsonKey(name: 'is_active') final bool isActive,
    @JsonKey(name: 'updated_at') final int? updatedAt,
  }) = _$VehicleDtoImpl;

  factory _VehicleDto.fromJson(Map<String, dynamic> json) =
      _$VehicleDtoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get brand;
  @override
  String get model;
  @override
  int get year;
  @override
  int get mileage;
  @override
  String? get nickname;
  @override
  String? get vin;
  @override
  String? get plate;
  @override
  @JsonKey(name: 'photo_url')
  String? get photoUrl;
  @override
  @JsonKey(name: 'fuel_type')
  String? get fuelType;
  @override
  @JsonKey(name: 'engine_volume')
  double? get engineVolume;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'updated_at')
  int? get updatedAt;

  /// Create a copy of VehicleDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleDtoImplCopyWith<_$VehicleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
