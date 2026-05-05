import 'package:injectable/injectable.dart';

import '../../../../core/error/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/no_params.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/vehicle.dart';
import '../repository/vehicles_repository.dart';

@lazySingleton
class GetVehiclesUseCase implements UseCase<List<Vehicle>, NoParams> {
  const GetVehiclesUseCase(this._repository);
  final VehiclesRepository _repository;

  @override
  Future<Either<Failure, List<Vehicle>>> call(NoParams params) =>
      _repository.getAll();
}
