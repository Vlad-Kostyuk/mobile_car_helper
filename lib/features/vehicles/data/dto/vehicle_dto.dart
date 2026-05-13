import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_dto.freezed.dart';
part 'vehicle_dto.g.dart';

@freezed
class VehicleDto with _$VehicleDto {
  const factory VehicleDto({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    required String brand,
    required String model,
    required int year,
    required int mileage,
    String? nickname,
    String? vin,
    String? plate,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'fuel_type') String? fuelType,
    @JsonKey(name: 'engine_volume') double? engineVolume,
    @JsonKey(name: 'is_active') @Default(false) bool isActive,
    @JsonKey(name: 'updated_at') int? updatedAt,
  }) = _VehicleDto;

  factory VehicleDto.fromJson(Map<String, dynamic> json) =>
      _$VehicleDtoFromJson(json);
}
