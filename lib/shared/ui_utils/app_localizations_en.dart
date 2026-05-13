// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'CarMaintenance';

  @override
  String get errorNetwork => 'Network error. Check your internet connection.';

  @override
  String get errorCache => 'Error reading local data.';

  @override
  String get errorAuth => 'Authentication error. Please sign in again.';

  @override
  String get errorNotFound => 'Data not found.';

  @override
  String get errorUnknown => 'Unknown error. Please try again.';

  @override
  String get retry => 'Retry';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get loading => 'Loading...';

  @override
  String get navHome => 'Home';

  @override
  String get navWorks => 'Works';

  @override
  String get navCalendar => 'Calendar';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navProfile => 'Profile';

  @override
  String get statusOk => 'OK';

  @override
  String get statusSoon => 'Soon';

  @override
  String get statusOverdue => 'Overdue';

  @override
  String get splashTagline => 'Your smart assistant\nfor car maintenance';

  @override
  String get onboardingSlide1StepLabel => '01 / 03';

  @override
  String get onboardingSlide1Title => 'Plan your\nmaintenance';

  @override
  String get onboardingSlide1Description =>
      'Add work orders and get reminders for oil changes, filter replacements, and timing belt service on time.';

  @override
  String get onboardingSlide2StepLabel => '02 / 03';

  @override
  String get onboardingSlide2Title => 'Manage multiple\nvehicles';

  @override
  String get onboardingSlide2Description =>
      'Add several cars and quickly switch between them right from the main menu.';

  @override
  String get onboardingSlide3StepLabel => '03 / 03';

  @override
  String get onboardingSlide3Title => 'Works offline and\nsyncs automatically';

  @override
  String get onboardingSlide3Description =>
      'Your history is available without internet. Data syncs automatically when connected.';

  @override
  String get onboardingButtonNext => 'Next →';

  @override
  String get onboardingButtonStart => 'Get started →';

  @override
  String get onboardingButtonSkip => 'Skip';

  @override
  String get labelEmail => 'Email address';

  @override
  String get hintEmail => 'name@example.com';

  @override
  String get labelPassword => 'Password';

  @override
  String get labelFirstName => 'First name';

  @override
  String get hintFirstName => 'John';

  @override
  String get labelLastName => 'Last name';

  @override
  String get hintLastName => 'Doe';

  @override
  String get labelConfirmPassword => 'Confirm password';

  @override
  String get validationEmailRequired => 'Enter your email';

  @override
  String get validationEmailInvalid => 'Invalid email format';

  @override
  String get validationPasswordRequired => 'Enter your password';

  @override
  String get validationPasswordMinLength =>
      'Password must be at least 8 characters';

  @override
  String get validationPasswordsMismatch => 'Passwords do not match';

  @override
  String get validationFirstNameRequired => 'Enter your first name';

  @override
  String get authOrContinueWith => 'OR CONTINUE WITH';

  @override
  String get loginTitle => 'Sign in';

  @override
  String get loginSubtitle => 'Enter your credentials to access your account.';

  @override
  String get loginForgotPassword => 'Forgot password?';

  @override
  String get loginButton => 'Sign in →';

  @override
  String get loginNoAccount => 'Don\'t have an account? ';

  @override
  String get loginSignUpLink => 'Sign up';

  @override
  String get signUpTitle => 'Create account';

  @override
  String get signUpSubtitle =>
      'Create an account to manage your car and receive notifications.';

  @override
  String get signUpButton => 'Create account →';

  @override
  String get signUpHasAccount => 'Already have an account? ';

  @override
  String get signUpSignInLink => 'Sign in';

  @override
  String get forgotPasswordTitle => 'Reset password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email address and we\'ll send you a link to reset your password.';

  @override
  String get forgotPasswordBack => '← Back to sign in';

  @override
  String get forgotPasswordButton => 'Send reset link →';

  @override
  String get forgotPasswordTlsNote => 'ENCRYPTED WITH TLS 1.3';

  @override
  String get forgotPasswordSuccessTitle => 'Check your inbox';

  @override
  String forgotPasswordSuccessMessage(String email) {
    return 'A password reset link has been sent to $email. Check your inbox.';
  }

  @override
  String get forgotPasswordSuccessMessageNoEmail =>
      'A password reset link has been sent. Check your inbox.';

  @override
  String get forgotPasswordBackToLogin => 'Back to sign in';

  @override
  String get authErrorNetwork =>
      'Network error. Check your internet connection';

  @override
  String get authErrorInvalidCredentials => 'Invalid email or password';

  @override
  String get authErrorAlreadyRegistered =>
      'An account with this email already exists';

  @override
  String get authErrorEmailNotConfirmed => 'Please confirm your email address';

  @override
  String get authErrorUnknown => 'Something went wrong. Please try again later';

  @override
  String get splashVersion => 'VERSION 2.4.0';

  @override
  String get splashAppName => 'CarHelper';

  @override
  String get dashboardTitle => 'Car status';

  @override
  String get dashboardSelectedCar => 'SELECTED VEHICLE';

  @override
  String get dashboardCurrentMileage => 'CURRENT MILEAGE';

  @override
  String get dashboardMileageUnit => 'km';

  @override
  String get dashboardAddService => 'ADD SERVICE';

  @override
  String get dashboardAddWork => 'ADD WORK';

  @override
  String get dashboardCarHealth => 'Car health';

  @override
  String get dashboardRecentServices => 'RECENT SERVICES';

  @override
  String get dashboardViewAll => 'VIEW ALL';

  @override
  String get dashboardBadgeSoon => 'DUE SOON';

  @override
  String get dashboardBadgePlanned => 'PLANNED';

  @override
  String get dashboardBadgeDone => 'DONE';

  @override
  String get dashboardNavStatus => 'STATUS';

  @override
  String get dashboardNavCalendar => 'CALENDAR';

  @override
  String get dashboardNavServices => 'SERVICES';

  @override
  String get dashboardNavNotifications => 'ALERTS';

  @override
  String get drawerMyProfile => 'My profile';

  @override
  String get drawerMyCars => 'My vehicles';

  @override
  String get drawerReminders => 'Reminders';

  @override
  String get drawerSettings => 'Settings';

  @override
  String get drawerSignOut => 'Sign out';

  @override
  String get drawerVersion => 'CarHelper v1.0.0';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsSectionGeneral => 'GENERAL SETTINGS';

  @override
  String get settingsSectionNotifications => 'NOTIFICATIONS';

  @override
  String get settingsSectionData => 'DATA & SYNC';

  @override
  String get settingsLanguageTitle => 'Interface language';

  @override
  String get settingsLanguageValue => 'English';

  @override
  String get settingsUnitsTitle => 'Units of measurement';

  @override
  String get settingsUnitsKm => 'Kilometres, Litres';

  @override
  String get settingsUnitsMiles => 'Miles, Gallons';

  @override
  String get settingsThemeTitle => 'Appearance';

  @override
  String get settingsThemeDark => 'Dark theme';

  @override
  String get settingsThemeLight => 'Light theme';

  @override
  String get settingsPushTitle => 'Push notifications';

  @override
  String get settingsPushSubtitle => 'Important service reminders';

  @override
  String get settingsEmailTitle => 'Email reports';

  @override
  String get settingsEmailSubtitle => 'Monthly expense summary';

  @override
  String get settingsSyncTitle => 'Cloud sync';

  @override
  String get settingsSyncSubtitle => 'Last sync: Today, 10:45';

  @override
  String get settingsExportTitle => 'Export data';

  @override
  String get settingsExportSubtitle => 'PDF or CSV format';

  @override
  String get settingsFooterPrivacy => 'Privacy';

  @override
  String get settingsFooterSupport => 'Support';

  @override
  String get settingsFooterVersion => 'VERSION 1.0.0 (BUILD 1)';

  @override
  String get settingsFooterAppName => 'CAR HELPER';

  @override
  String get settingsUnitKm => 'KM';

  @override
  String get settingsUnitMl => 'MI';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileSectionPersonal => 'Personal information';

  @override
  String get profileSectionSettings => 'Settings';

  @override
  String get profileSectionAccount => 'Account';

  @override
  String get profileEditButton => 'Edit';

  @override
  String get profileSaveButton => 'Save';

  @override
  String get profileCancelButton => 'Cancel';

  @override
  String get profileFieldFirstName => 'First name';

  @override
  String get profileFieldLastName => 'Last name';

  @override
  String get profileFieldEmail => 'Email';

  @override
  String get profileHintFirstName => 'John';

  @override
  String get profileHintLastName => 'Doe';

  @override
  String get profileUnitsTitle => 'Units';

  @override
  String get profileUnitKm => 'KM';

  @override
  String get profileUnitMi => 'MI';

  @override
  String get profileChangePassword => 'Change password';

  @override
  String get profileSignOut => 'Sign out';

  @override
  String get vehiclesTitle => 'Vehicles';

  @override
  String get vehiclesEmpty => 'No vehicles yet. Add your first!';

  @override
  String vehiclesMileageFormat(int year, int mileage) {
    return '$year • $mileage km';
  }

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsEmpty => 'No notifications';

  @override
  String get maintenanceTitle => 'Works';

  @override
  String get calendarTitle => 'Calendar';

  @override
  String get networkErrorNoConnection => 'No internet connection';
}
