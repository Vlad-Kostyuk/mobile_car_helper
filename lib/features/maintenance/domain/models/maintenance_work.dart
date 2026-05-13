import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_work.freezed.dart';

enum MaintenanceStatus { ok, soon, overdue }

@freezed
class MaintenanceWork with _$MaintenanceWork {
  const factory MaintenanceWork({
    required String id,
    required String vehicleId,
    String? templateId,
    String? customName,
    int? intervalKm,
    int? intervalMonths,
    DateTime? nextDate,
    int? nextMileage,
    @Default(MaintenanceStatus.ok) MaintenanceStatus status,
  }) = _MaintenanceWork;
}
