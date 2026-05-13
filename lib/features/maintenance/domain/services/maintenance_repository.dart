import '../../../../shared/base_domain/either.dart';
import '../../../../shared/base_domain/failure.dart';
import '../models/maintenance_record.dart';
import '../models/maintenance_work.dart';

abstract interface class MaintenanceRepository {
  Future<Either<Failure, List<MaintenanceWork>>> getWorksByVehicle(String vehicleId);
  Future<Either<Failure, MaintenanceWork>> addWork(MaintenanceWork work);
  Future<Either<Failure, MaintenanceWork>> updateWork(MaintenanceWork work);
  Future<Either<Failure, void>> deleteWork(String id);
  Future<Either<Failure, List<MaintenanceRecord>>> getRecordsByWork(String workId);
  Future<Either<Failure, MaintenanceRecord>> addRecord(MaintenanceRecord record);
  Future<Either<Failure, void>> deleteRecord(String id);
}
