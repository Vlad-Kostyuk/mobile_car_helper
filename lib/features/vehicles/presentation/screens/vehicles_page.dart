import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/ui_utils/l10n_extension.dart';
import '../../../../shared/ui_kit/app_error_widget.dart';
import '../../../../shared/ui_kit/app_loading_indicator.dart';
import '../controllers/vehicles_cubit.dart';
import '../controllers/vehicles_view_model.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({super.key});

  @override
  State<VehiclesPage> createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  @override
  void initState() {
    super.initState();
    context.read<VehiclesCubit>().loadVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.vehiclesTitle)),
      body: BlocBuilder<VehiclesCubit, VehiclesViewModel>(
        builder: (context, vm) {
          if (vm.isLoading) return const AppLoadingIndicator();
          if (vm.error != null) {
            return AppErrorWidget(
              message: vm.error!,
              onRetry: () => context.read<VehiclesCubit>().loadVehicles(),
            );
          }
          if (vm.vehicles.isEmpty) {
            return Center(child: Text(context.l10n.vehiclesEmpty));
          }
          return ListView.builder(
            itemCount: vm.vehicles.length,
            itemBuilder: (context, i) => ListTile(
              title: Text('${vm.vehicles[i].brand} ${vm.vehicles[i].model}'),
              subtitle: Text(context.l10n.vehiclesMileageFormat(vm.vehicles[i].year, vm.vehicles[i].mileage)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
