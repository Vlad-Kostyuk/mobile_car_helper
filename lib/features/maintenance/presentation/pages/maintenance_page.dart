import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_indicator.dart';
import '../maintenance_cubit.dart';
import '../model/maintenance_view_model.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Роботи')),
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
