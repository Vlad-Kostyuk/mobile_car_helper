import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/app_error_widget.dart';
import '../../../../shared/widgets/app_loading_indicator.dart';
import '../vehicles_cubit.dart';
import '../model/vehicles_view_model.dart';

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
      appBar: AppBar(title: const Text('Автомобілі')),
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
            return const Center(child: Text('Немає авто. Додайте перше!'));
          }
          return ListView.builder(
            itemCount: vm.vehicles.length,
            itemBuilder: (context, i) => ListTile(
              title: Text('${vm.vehicles[i].brand} ${vm.vehicles[i].model}'),
              subtitle: Text('${vm.vehicles[i].year} • ${vm.vehicles[i].mileage} км'),
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
