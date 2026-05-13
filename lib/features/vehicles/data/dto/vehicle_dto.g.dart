// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleDtoImpl _$$VehicleDtoImplFromJson(Map<String, dynamic> json) =>
    _$VehicleDtoImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      mileage: (json['mileage'] as num).toInt(),
      nickname: json['nickname'] as String?,
      vin: json['vin'] as String?,
      plate: json['plate'] as String?,
      photoUrl: json['photo_url'] as String?,
      fuelType: json['fuel_type'] as String?,
      engineVolume: (json['engine_volume'] as num?)?.toDouble(),
      isActive: json['is_active'] as bool? ?? false,
      updatedAt: (json['updated_at'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VehicleDtoImplToJson(_$VehicleDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'brand': instance.brand,
      'model': instance.model,
      'year': instance.year,
      'mileage': instance.mileage,
      'nickname': instance.nickname,
      'vin': instance.vin,
      'plate': instance.plate,
      'photo_url': instance.photoUrl,
      'fuel_type': instance.fuelType,
      'engine_volume': instance.engineVolume,
      'is_active': instance.isActive,
      'updated_at': instance.updatedAt,
    };
