import '../../domain/model/vehicle.dart';
import './vehicle_dto.dart';

abstract final class VehicleMapper {
  static Vehicle toEntity(VehicleDto dto) => Vehicle(
    id: dto.id,
    userId: dto.userId,
    brand: dto.brand,
    model: dto.model,
    year: dto.year,
    mileage: dto.mileage,
    nickname: dto.nickname,
    vin: dto.vin,
    plate: dto.plate,
    photoUrl: dto.photoUrl,
    fuelType: FuelType.values.byName(dto.fuelType ?? 'gasoline'),
    engineVolume: dto.engineVolume,
    isActive: dto.isActive,
  );

  static VehicleDto toDto(Vehicle entity) => VehicleDto(
    id: entity.id,
    userId: entity.userId,
    brand: entity.brand,
    model: entity.model,
    year: entity.year,
    mileage: entity.mileage,
    nickname: entity.nickname,
    vin: entity.vin,
    plate: entity.plate,
    photoUrl: entity.photoUrl,
    fuelType: entity.fuelType.name,
    engineVolume: entity.engineVolume,
    isActive: entity.isActive,
  );
}
