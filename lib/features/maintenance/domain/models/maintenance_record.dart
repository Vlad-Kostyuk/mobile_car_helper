import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_record.freezed.dart';

@freezed
class MaintenanceRecord with _$MaintenanceRecord {
  const factory MaintenanceRecord({
    required String id,
    required String workId,
    required String vehicleId,
    required DateTime performedAt,
    required int mileageAtService,
    String? serviceLocation,
    double? cost,
    String? notes,
    @Default([]) List<String> photoUrls,
  }) = _MaintenanceRecord;
}
