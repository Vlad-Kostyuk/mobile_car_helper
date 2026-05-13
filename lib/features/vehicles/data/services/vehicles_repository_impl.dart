import 'package:injectable/injectable.dart';

import '../../../../shared/base_domain/either.dart';
import '../../../../shared/base_domain/exceptions.dart';
import '../../../../shared/base_domain/failure.dart';
import '../../../../shared/base_data/network_info.dart';
import '../../domain/models/vehicle.dart';
import '../../domain/services/vehicles_repository.dart';
import '../data_sources/local/vehicles_local_datasource.dart';
import '../data_sources/remote/vehicles_remote_datasource.dart';
import '../mappers/vehicle_mapper.dart';
import '../dto/vehicle_dto.dart';

@LazySingleton(as: VehiclesRepository)
class VehiclesRepositoryImpl implements VehiclesRepository {
  const VehiclesRepositoryImpl({
    required this.localDs,
    required this.remoteDs,
    required this.networkInfo,
  });

  final VehiclesLocalDataSource localDs;
  final VehiclesRemoteDataSource remoteDs;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Vehicle>>> getAll() async {
    try {
      final rows = await localDs.getAll('');
      final vehicles = rows
          .map((r) => VehicleMapper.toEntity(VehicleDto.fromJson(r)))
          .toList();
      _syncIfOnline();
      return Right(vehicles);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> getById(String id) async {
    try {
      final row = await localDs.getById(id);
      if (row == null) return const Left(Failure.notFound('Vehicle not found'));
      return Right(VehicleMapper.toEntity(VehicleDto.fromJson(row)));
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> add(Vehicle vehicle) async {
    try {
      final dto = VehicleMapper.toDto(vehicle);
      await localDs.save(dto.toJson());
      _syncIfOnline();
      return Right(vehicle);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    }
  }

  @override
  Future<Either<Failure, Vehicle>> update(Vehicle vehicle) => add(vehicle);

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await localDs.delete(id);
      _syncIfOnline();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(Failure.cache(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> setActive(String id) async {
    return const Right(null);
  }

  Future<void> _syncIfOnline() async {
    if (await networkInfo.isConnected) {
      // TODO: trigger SyncUseCase
    }
  }
}
