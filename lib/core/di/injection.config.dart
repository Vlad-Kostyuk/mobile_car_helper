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
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/domain/repository/auth_repository.dart' as _i996;
import '../../features/auth/presentation/auth_cubit.dart' as _i731;
import '../../features/calendar/presentation/calendar_cubit.dart' as _i315;
import '../../features/maintenance/domain/repository/maintenance_repository.dart' as _i253;
import '../../features/maintenance/presentation/maintenance_cubit.dart'
    as _i484;
import '../../features/notifications/presentation/notifications_cubit.dart'
    as _i803;
import '../../features/profile/presentation/profile_cubit.dart' as _i666;
import '../../features/vehicles/data/source/local/vehicles_local_datasource.dart' as _i708;
import '../../features/vehicles/data/source/remote/vehicles_remote_datasource.dart' as _i372;
import '../../features/vehicles/data/repository/vehicles_repository_impl.dart' as _i112;
import '../../features/vehicles/domain/use_case/add_vehicle_usecase.dart' as _i320;
import '../../features/vehicles/domain/use_case/get_vehicles_usecase.dart' as _i44;
import '../../features/vehicles/domain/repository/vehicles_repository.dart' as _i177;
import '../../features/vehicles/presentation/vehicles_cubit.dart' as _i795;
import '../network/dio_client.dart' as _i667;
import '../network/network_info.dart' as _i932;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i315.CalendarCubit>(() => _i315.CalendarCubit());
    gh.factory<_i666.ProfileCubit>(() => _i666.ProfileCubit());
    gh.factory<_i803.NotificationsCubit>(() => _i803.NotificationsCubit());
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.factory<_i484.MaintenanceCubit>(
      () => _i484.MaintenanceCubit(gh<_i253.MaintenanceRepository>()),
    );
    gh.factory<_i731.AuthCubit>(
      () => _i731.AuthCubit(gh<_i996.AuthRepository>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
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
