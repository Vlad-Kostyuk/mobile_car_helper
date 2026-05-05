import '../../../../core/error/either.dart';
import '../../../../core/error/failure.dart';
import '../model/vehicle.dart';

abstract interface class VehiclesRepository {
  Future<Either<Failure, List<Vehicle>>> getAll();
  Future<Either<Failure, Vehicle>> getById(String id);
  Future<Either<Failure, Vehicle>> add(Vehicle vehicle);
  Future<Either<Failure, Vehicle>> update(Vehicle vehicle);
  Future<Either<Failure, void>> delete(String id);
  Future<Either<Failure, void>> setActive(String id);
}
