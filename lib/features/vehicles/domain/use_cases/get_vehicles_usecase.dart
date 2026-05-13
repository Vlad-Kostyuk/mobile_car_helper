import 'package:injectable/injectable.dart';

import '../../../../shared/base_domain/either.dart';
import '../../../../shared/base_domain/failure.dart';
import '../../../../shared/base_domain/no_params.dart';
import '../../../../shared/base_domain/usecase.dart';
import '../models/vehicle.dart';
import '../services/vehicles_repository.dart';

@lazySingleton
class GetVehiclesUseCase implements UseCase<List<Vehicle>, NoParams> {
  const GetVehiclesUseCase(this._repository);
  final VehiclesRepository _repository;

  @override
  Future<Either<Failure, List<Vehicle>>> call(NoParams params) =>
      _repository.getAll();
}
