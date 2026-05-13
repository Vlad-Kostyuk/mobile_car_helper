// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i400;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i460;

import '../../../features/auth/data/services/auth_repository_impl.dart'
    as _i999;
import '../../../features/auth/data/data_sources/remote/auth_remote_datasource.dart'
    as _i888;
import '../../../features/auth/domain/services/auth_repository.dart' as _i996;
import '../../../features/auth/presentation/controllers/auth_cubit.dart' as _i731;
import '../../../features/calendar/presentation/controllers/calendar_cubit.dart' as _i315;
import '../../../features/maintenance/domain/services/maintenance_repository.dart'
    as _i253;
import '../../../features/maintenance/presentation/controllers/maintenance_cubit.dart'
    as _i484;
import '../../../features/notifications/presentation/controllers/notifications_cubit.dart'
    as _i803;
import '../../../features/profile/data/services/profile_repository_impl.dart'
    as _i103;
import '../../../features/profile/data/data_sources/remote/profile_remote_datasource.dart'
    as _i101;
import '../../../features/profile/domain/services/profile_repository.dart'
    as _i102;
import '../../../features/profile/presentation/controllers/profile_cubit.dart' as _i666;
import '../../../features/settings/presentation/controllers/settings_cubit.dart' as _i550;
import '../../../features/vehicles/data/services/vehicles_repository_impl.dart'
    as _i112;
import '../../../features/vehicles/data/data_sources/local/vehicles_local_datasource.dart'
    as _i708;
import '../../../features/vehicles/data/data_sources/remote/vehicles_remote_datasource.dart'
    as _i372;
import '../../../features/vehicles/domain/services/vehicles_repository.dart'
    as _i177;
import '../../../features/vehicles/domain/use_cases/add_vehicle_usecase.dart'
    as _i320;
import '../../../features/vehicles/domain/use_cases/get_vehicles_usecase.dart'
    as _i44;
import '../../../features/vehicles/presentation/controllers/vehicles_cubit.dart' as _i795;
import '../../../shared/base_data/dio_client.dart' as _i667;
import '../../../shared/base_data/network_info.dart' as _i932;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);

    // ── Infrastructure ──────────────────────────────────────────────────────
    gh.lazySingleton<_i895.Connectivity>(() => _i895.Connectivity());
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );

    // ── Supabase & Google ────────────────────────────────────────────────────
    gh.lazySingleton<_i460.SupabaseClient>(
      () => _i460.Supabase.instance.client,
    );
    gh.lazySingleton<_i400.GoogleSignIn>(
      () => _i400.GoogleSignIn(scopes: const ['email', 'profile']),
    );

    // ── Auth data layer ──────────────────────────────────────────────────────
    gh.lazySingleton<_i888.AuthRemoteDataSource>(
      () => _i888.SupabaseAuthDataSource(
        gh<_i460.SupabaseClient>(),
        gh<_i400.GoogleSignIn>(),
      ),
    );
    gh.lazySingleton<_i996.AuthRepository>(
      () => _i999.AuthRepositoryImpl(gh<_i888.AuthRemoteDataSource>()),
    );

    // ── Auth presentation ────────────────────────────────────────────────────
    gh.lazySingleton<_i731.AuthCubit>(
      () => _i731.AuthCubit(gh<_i996.AuthRepository>()),
    );

    // ── Profile data layer ───────────────────────────────────────────────────
    gh.lazySingleton<_i101.ProfileRemoteDataSource>(
      () => _i101.SupabaseProfileDataSource(gh<_i460.SupabaseClient>()),
    );
    gh.lazySingleton<_i102.ProfileRepository>(
      () => _i103.ProfileRepositoryImpl(gh<_i101.ProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i666.ProfileCubit>(
      () => _i666.ProfileCubit(gh<_i102.ProfileRepository>()),
    );

    // ── Settings ─────────────────────────────────────────────────────────────
    gh.lazySingleton<_i550.SettingsCubit>(() => _i550.SettingsCubit());

    // ── Other cubits (factory — scoped per screen) ───────────────────────────
    gh.factory<_i315.CalendarCubit>(() => _i315.CalendarCubit());
    gh.factory<_i803.NotificationsCubit>(() => _i803.NotificationsCubit());
    gh.factory<_i484.MaintenanceCubit>(
      () => _i484.MaintenanceCubit(gh<_i253.MaintenanceRepository>()),
    );

    // ── Vehicles ─────────────────────────────────────────────────────────────
    gh.lazySingleton<_i177.VehiclesRepository>(
      () => _i112.VehiclesRepositoryImpl(
        localDs: gh<_i708.VehiclesLocalDataSource>(),
        remoteDs: gh<_i372.VehiclesRemoteDataSource>(),
        networkInfo: gh<_i932.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i44.GetVehiclesUseCase>(
      () => _i44.GetVehiclesUseCase(gh<_i177.VehiclesRepository>()),
    );
    gh.lazySingleton<_i320.AddVehicleUseCase>(
      () => _i320.AddVehicleUseCase(gh<_i177.VehiclesRepository>()),
    );
    gh.factory<_i795.VehiclesCubit>(
      () => _i795.VehiclesCubit(
        getVehicles: gh<_i44.GetVehiclesUseCase>(),
        addVehicle: gh<_i320.AddVehicleUseCase>(),
      ),
    );

    return this;
  }
}
