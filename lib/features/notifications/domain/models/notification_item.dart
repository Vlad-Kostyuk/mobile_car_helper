import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_item.freezed.dart';

@freezed
class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required String id,
    required String title,
    required String body,
    required DateTime createdAt,
    @Default(false) bool isRead,
    String? workId,
  }) = _NotificationItem;
}
