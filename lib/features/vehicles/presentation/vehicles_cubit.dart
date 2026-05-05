import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/no_params.dart';
import '../domain/model/vehicle.dart';
import '../domain/use_case/add_vehicle_usecase.dart';
import '../domain/use_case/get_vehicles_usecase.dart';
import './model/vehicles_view_model.dart';

@injectable
class VehiclesCubit extends Cubit<VehiclesViewModel> {
  VehiclesCubit({
    required GetVehiclesUseCase getVehicles,
    required AddVehicleUseCase addVehicle,
  })  : _getVehicles = getVehicles,
        _addVehicle = addVehicle,
        super(const VehiclesViewModel());

  final GetVehiclesUseCase _getVehicles;
  final AddVehicleUseCase _addVehicle;

  Future<void> loadVehicles() async {
    _emitLoading();
    final result = await _getVehicles(const NoParams());
    result.fold(_emitFailure, _emitVehicles);
  }

  Future<void> addVehicle(Vehicle vehicle) async {
    final result = await _addVehicle(vehicle);
    result.fold(_emitFailure, (_) => loadVehicles());
  }

  void _emitLoading() => emit(state.copyWith(isLoading: true, error: null));

  void _emitFailure(Failure failure) => emit(
    state.copyWith(
      isLoading: false,
      error: failure.when(
        network: (m) => m,
        cache: (m) => m,
        auth: (m) => m,
        notFound: (m) => m,
        unknown: (m) => m,
      ),
    ),
  );

  void _emitVehicles(List<Vehicle> vehicles) =>
      emit(state.copyWith(isLoading: false, vehicles: vehicles));
}
