import 'package:injectable/injectable.dart';

import '../../../../core/error/either.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/model/vehicle.dart';
import '../../domain/repository/vehicles_repository.dart';
import '../source/local/vehicles_local_datasource.dart';
import '../source/remote/vehicles_remote_datasource.dart';
import '../model/vehicle_mapper.dart';
import '../model/vehicle_dto.dart';

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
