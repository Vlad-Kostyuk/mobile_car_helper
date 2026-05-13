import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/vehicle.dart';

part 'vehicles_view_model.freezed.dart';

@freezed
class VehiclesViewModel with _$VehiclesViewModel {
  const factory VehiclesViewModel({
    @Default([]) List<Vehicle> vehicles,
    @Default(false) bool isLoading,
    String? error,
    String? activeVehicleId,
  }) = _VehiclesViewModel;

  factory VehiclesViewModel.initial() => const VehiclesViewModel();
}
