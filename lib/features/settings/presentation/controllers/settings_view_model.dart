class SettingsViewModel {
  const SettingsViewModel({
    this.pushNotifications = true,
    this.emailReports = false,
    this.darkMode = false,
  });

  final bool pushNotifications;
  final bool emailReports;
  final bool darkMode;

  SettingsViewModel copyWith({
    bool? pushNotifications,
    bool? emailReports,
    bool? darkMode,
  }) {
    return SettingsViewModel(
      pushNotifications: pushNotifications ?? this.pushNotifications,
      emailReports: emailReports ?? this.emailReports,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
