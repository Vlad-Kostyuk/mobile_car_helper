import 'package:injectable/injectable.dart';

import '../../../../core/error/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/vehicle.dart';
import '../repository/vehicles_repository.dart';

@lazySingleton
class AddVehicleUseCase implements UseCase<Vehicle, Vehicle> {
  const AddVehicleUseCase(this._repository);
  final VehiclesRepository _repository;

  @override
  Future<Either<Failure, Vehicle>> call(Vehicle params) =>
      _repository.add(params);
}
