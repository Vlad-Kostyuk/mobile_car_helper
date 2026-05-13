import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'apps/car_helper_app/di/injection.dart';
import 'apps/car_helper_app/router/app_router.dart';
import 'features/auth/presentation/controllers/auth_cubit.dart';
import 'shared/ui_utils/l10n_extension.dart';
import 'shared/ui_kit/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  await configureDependencies();
  runApp(const CarMaintenanceApp());
}

class CarMaintenanceApp extends StatefulWidget {
  const CarMaintenanceApp({super.key});

  @override
  State<CarMaintenanceApp> createState() => _CarMaintenanceAppState();
}

class _CarMaintenanceAppState extends State<CarMaintenanceApp> {
  late final AuthCubit _authCubit;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authCubit = getIt<AuthCubit>()..initialize();
    _router = buildRouter(_authCubit);
  }

  @override
  void dispose() {
    _authCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authCubit,
      child: MaterialApp.router(
        title: 'CarHelper',
        theme: AppTheme.light,
        routerConfig: _router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('uk'),
      ),
    );
  }
}
