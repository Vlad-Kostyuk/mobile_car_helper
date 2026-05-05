import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/notification_item.dart';

part 'notifications_view_model.freezed.dart';

@freezed
class NotificationsViewModel with _$NotificationsViewModel {
  const factory NotificationsViewModel({
    @Default([]) List<NotificationItem> items,
    @Default(false) bool isLoading,
    String? error,
  }) = _NotificationsViewModel;

  factory NotificationsViewModel.initial() => const NotificationsViewModel();
}
