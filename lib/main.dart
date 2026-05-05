import 'package:flutter/material.dart';

import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const CarMaintenanceApp());
}

class CarMaintenanceApp extends StatelessWidget {
  const CarMaintenanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarMaintenance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(child: Text('CarMaintenance')),
      ),
    );
  }
}
