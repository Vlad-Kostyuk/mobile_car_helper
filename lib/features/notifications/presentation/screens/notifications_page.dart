import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/ui_utils/l10n_extension.dart';
import '../controllers/notifications_cubit.dart';
import '../controllers/notifications_view_model.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.notificationsTitle)),
      body: BlocBuilder<NotificationsCubit, NotificationsViewModel>(
        builder: (context, vm) {
          if (vm.items.isEmpty) {
            return Center(child: Text(context.l10n.notificationsEmpty));
          }
          return ListView.builder(
            itemCount: vm.items.length,
            itemBuilder: (context, i) => ListTile(
              title: Text(vm.items[i].title),
              subtitle: Text(vm.items[i].body),
              leading: vm.items[i].isRead
                  ? const Icon(Icons.notifications_none)
                  : const Icon(Icons.notifications_active, color: Colors.orange),
            ),
          );
        },
      ),
    );
  }
}
