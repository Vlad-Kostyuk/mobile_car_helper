import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';

enum FuelType { gasoline, diesel, lpg, electric, hybrid }

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle({
    required String id,
    required String userId,
    required String brand,
    required String model,
    required int year,
    required int mileage,
    String? nickname,
    String? vin,
    String? plate,
    String? photoUrl,
    @Default(FuelType.gasoline) FuelType fuelType,
    double? engineVolume,
    @Default(false) bool isActive,
  }) = _Vehicle;
}
