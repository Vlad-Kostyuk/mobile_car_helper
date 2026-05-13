import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/services/maintenance_repository.dart';
import './maintenance_view_model.dart';

@injectable
class MaintenanceCubit extends Cubit<MaintenanceViewModel> {
  MaintenanceCubit(this._repository) : super(const MaintenanceViewModel());

  final MaintenanceRepository _repository;

  Future<void> loadWorks(String vehicleId) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.getWorksByVehicle(vehicleId);
    result.fold(
      (f) => emit(state.copyWith(isLoading: false, error: f.when(
        network: (m) => m, cache: (m) => m, auth: (m) => m,
        notFound: (m) => m, unknown: (m) => m,
      ))),
      (works) => emit(state.copyWith(isLoading: false, works: works)),
    );
  }

  void setTab(WorksTab tab) => emit(state.copyWith(activeTab: tab));
  void setSearch(String query) => emit(state.copyWith(searchQuery: query));
}
