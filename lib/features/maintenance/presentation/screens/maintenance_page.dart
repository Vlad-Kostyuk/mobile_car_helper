import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/ui_utils/l10n_extension.dart';
import '../../../../shared/ui_kit/app_error_widget.dart';
import '../../../../shared/ui_kit/app_loading_indicator.dart';
import '../controllers/maintenance_cubit.dart';
import '../controllers/maintenance_view_model.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.maintenanceTitle)),
      body: BlocBuilder<MaintenanceCubit, MaintenanceViewModel>(
        builder: (context, vm) {
          if (vm.isLoading) return const AppLoadingIndicator();
          if (vm.error != null) return AppErrorWidget(message: vm.error!);
          return const Center(child: Text('TODO: works list'));
        },
      ),
    );
  }
}
