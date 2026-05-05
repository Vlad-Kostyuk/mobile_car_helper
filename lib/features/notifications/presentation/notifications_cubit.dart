import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import './model/notifications_view_model.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsViewModel> {
  NotificationsCubit() : super(const NotificationsViewModel());

  void markAsRead(String id) {
    final updated = state.items.map(
      (n) => n.id == id ? n.copyWith(isRead: true) : n,
    ).toList();
    emit(state.copyWith(items: updated));
  }
}
