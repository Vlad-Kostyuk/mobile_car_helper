import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/maintenance_work.dart';

part 'maintenance_view_model.freezed.dart';

enum WorksTab { planned, done, all }

@freezed
class MaintenanceViewModel with _$MaintenanceViewModel {
  const factory MaintenanceViewModel({
    @Default([]) List<MaintenanceWork> works,
    @Default(false) bool isLoading,
    @Default(WorksTab.planned) WorksTab activeTab,
    String? error,
    String? searchQuery,
  }) = _MaintenanceViewModel;

  factory MaintenanceViewModel.initial() => const MaintenanceViewModel();
}
