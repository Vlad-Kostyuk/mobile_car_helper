import 'package:injectable/injectable.dart';

import '../../../../shared/base_domain/either.dart';
import '../../../../shared/base_domain/failure.dart';
import '../../../../shared/base_domain/usecase.dart';
import '../models/vehicle.dart';
import '../services/vehicles_repository.dart';

@lazySingleton
class AddVehicleUseCase implements UseCase<Vehicle, Vehicle> {
  const AddVehicleUseCase(this._repository);
  final VehiclesRepository _repository;

  @override
  Future<Either<Failure, Vehicle>> call(Vehicle params) =>
      _repository.add(params);
}
