import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import './settings_view_model.dart';

@lazySingleton
class SettingsCubit extends Cubit<SettingsViewModel> {
  SettingsCubit() : super(const SettingsViewModel());

  void togglePushNotifications() =>
      emit(state.copyWith(pushNotifications: !state.pushNotifications));

  void toggleEmailReports() =>
      emit(state.copyWith(emailReports: !state.emailReports));

  void toggleDarkMode() =>
      emit(state.copyWith(darkMode: !state.darkMode));
}
