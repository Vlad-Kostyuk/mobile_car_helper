import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'ui_utils/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('uk'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'CarMaintenance'**
  String get appName;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your internet connection.'**
  String get errorNetwork;

  /// No description provided for @errorCache.
  ///
  /// In en, this message translates to:
  /// **'Error reading local data.'**
  String get errorCache;

  /// No description provided for @errorAuth.
  ///
  /// In en, this message translates to:
  /// **'Authentication error. Please sign in again.'**
  String get errorAuth;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Data not found.'**
  String get errorNotFound;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown error. Please try again.'**
  String get errorUnknown;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navWorks.
  ///
  /// In en, this message translates to:
  /// **'Works'**
  String get navWorks;

  /// No description provided for @navCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get navCalendar;

  /// No description provided for @navNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get navNotifications;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @statusOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get statusOk;

  /// No description provided for @statusSoon.
  ///
  /// In en, this message translates to:
  /// **'Soon'**
  String get statusSoon;

  /// No description provided for @statusOverdue.
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get statusOverdue;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Your smart assistant\nfor car maintenance'**
  String get splashTagline;

  /// No description provided for @onboardingSlide1StepLabel.
  ///
  /// In en, this message translates to:
  /// **'01 / 03'**
  String get onboardingSlide1StepLabel;

  /// No description provided for @onboardingSlide1Title.
  ///
  /// In en, this message translates to:
  /// **'Plan your\nmaintenance'**
  String get onboardingSlide1Title;

  /// No description provided for @onboardingSlide1Description.
  ///
  /// In en, this message translates to:
  /// **'Add work orders and get reminders for oil changes, filter replacements, and timing belt service on time.'**
  String get onboardingSlide1Description;

  /// No description provided for @onboardingSlide2StepLabel.
  ///
  /// In en, this message translates to:
  /// **'02 / 03'**
  String get onboardingSlide2StepLabel;

  /// No description provided for @onboardingSlide2Title.
  ///
  /// In en, this message translates to:
  /// **'Manage multiple\nvehicles'**
  String get onboardingSlide2Title;

  /// No description provided for @onboardingSlide2Description.
  ///
  /// In en, this message translates to:
  /// **'Add several cars and quickly switch between them right from the main menu.'**
  String get onboardingSlide2Description;

  /// No description provided for @onboardingSlide3StepLabel.
  ///
  /// In en, this message translates to:
  /// **'03 / 03'**
  String get onboardingSlide3StepLabel;

  /// No description provided for @onboardingSlide3Title.
  ///
  /// In en, this message translates to:
  /// **'Works offline and\nsyncs automatically'**
  String get onboardingSlide3Title;

  /// No description provided for @onboardingSlide3Description.
  ///
  /// In en, this message translates to:
  /// **'Your history is available without internet. Data syncs automatically when connected.'**
  String get onboardingSlide3Description;

  /// No description provided for @onboardingButtonNext.
  ///
  /// In en, this message translates to:
  /// **'Next →'**
  String get onboardingButtonNext;

  /// No description provided for @onboardingButtonStart.
  ///
  /// In en, this message translates to:
  /// **'Get started →'**
  String get onboardingButtonStart;

  /// No description provided for @onboardingButtonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingButtonSkip;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get labelEmail;

  /// No description provided for @hintEmail.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get hintEmail;

  /// No description provided for @labelPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get labelPassword;

  /// No description provided for @labelFirstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get labelFirstName;

  /// No description provided for @hintFirstName.
  ///
  /// In en, this message translates to:
  /// **'John'**
  String get hintFirstName;

  /// No description provided for @labelLastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get labelLastName;

  /// No description provided for @hintLastName.
  ///
  /// In en, this message translates to:
  /// **'Doe'**
  String get hintLastName;

  /// No description provided for @labelConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get labelConfirmPassword;

  /// No description provided for @validationEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get validationEmailRequired;

  /// No description provided for @validationEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email format'**
  String get validationEmailInvalid;

  /// No description provided for @validationPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get validationPasswordRequired;

  /// No description provided for @validationPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get validationPasswordMinLength;

  /// No description provided for @validationPasswordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validationPasswordsMismatch;

  /// No description provided for @validationFirstNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get validationFirstNameRequired;

  /// No description provided for @authOrContinueWith.
  ///
  /// In en, this message translates to:
  /// **'OR CONTINUE WITH'**
  String get authOrContinueWith;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your credentials to access your account.'**
  String get loginSubtitle;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get loginForgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in →'**
  String get loginButton;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get loginNoAccount;

  /// No description provided for @loginSignUpLink.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get loginSignUpLink;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get signUpTitle;

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to manage your car and receive notifications.'**
  String get signUpSubtitle;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Create account →'**
  String get signUpButton;

  /// No description provided for @signUpHasAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get signUpHasAccount;

  /// No description provided for @signUpSignInLink.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signUpSignInLink;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a link to reset your password.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @forgotPasswordBack.
  ///
  /// In en, this message translates to:
  /// **'← Back to sign in'**
  String get forgotPasswordBack;

  /// No description provided for @forgotPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Send reset link →'**
  String get forgotPasswordButton;

  /// No description provided for @forgotPasswordTlsNote.
  ///
  /// In en, this message translates to:
  /// **'ENCRYPTED WITH TLS 1.3'**
  String get forgotPasswordTlsNote;

  /// No description provided for @forgotPasswordSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox'**
  String get forgotPasswordSuccessTitle;

  /// No description provided for @forgotPasswordSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent to {email}. Check your inbox.'**
  String forgotPasswordSuccessMessage(String email);

  /// No description provided for @forgotPasswordSuccessMessageNoEmail.
  ///
  /// In en, this message translates to:
  /// **'A password reset link has been sent. Check your inbox.'**
  String get forgotPasswordSuccessMessageNoEmail;

  /// No description provided for @forgotPasswordBackToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to sign in'**
  String get forgotPasswordBackToLogin;

  /// No description provided for @authErrorNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network error. Check your internet connection'**
  String get authErrorNetwork;

  /// No description provided for @authErrorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get authErrorInvalidCredentials;

  /// No description provided for @authErrorAlreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'An account with this email already exists'**
  String get authErrorAlreadyRegistered;

  /// No description provided for @authErrorEmailNotConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your email address'**
  String get authErrorEmailNotConfirmed;

  /// No description provided for @authErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again later'**
  String get authErrorUnknown;

  /// No description provided for @splashVersion.
  ///
  /// In en, this message translates to:
  /// **'VERSION 2.4.0'**
  String get splashVersion;

  /// No description provided for @splashAppName.
  ///
  /// In en, this message translates to:
  /// **'CarHelper'**
  String get splashAppName;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Car status'**
  String get dashboardTitle;

  /// No description provided for @dashboardSelectedCar.
  ///
  /// In en, this message translates to:
  /// **'SELECTED VEHICLE'**
  String get dashboardSelectedCar;

  /// No description provided for @dashboardCurrentMileage.
  ///
  /// In en, this message translates to:
  /// **'CURRENT MILEAGE'**
  String get dashboardCurrentMileage;

  /// No description provided for @dashboardMileageUnit.
  ///
  /// In en, this message translates to:
  /// **'km'**
  String get dashboardMileageUnit;

  /// No description provided for @dashboardAddService.
  ///
  /// In en, this message translates to:
  /// **'ADD SERVICE'**
  String get dashboardAddService;

  /// No description provided for @dashboardAddWork.
  ///
  /// In en, this message translates to:
  /// **'ADD WORK'**
  String get dashboardAddWork;

  /// No description provided for @dashboardCarHealth.
  ///
  /// In en, this message translates to:
  /// **'Car health'**
  String get dashboardCarHealth;

  /// No description provided for @dashboardRecentServices.
  ///
  /// In en, this message translates to:
  /// **'RECENT SERVICES'**
  String get dashboardRecentServices;

  /// No description provided for @dashboardViewAll.
  ///
  /// In en, this message translates to:
  /// **'VIEW ALL'**
  String get dashboardViewAll;

  /// No description provided for @dashboardBadgeSoon.
  ///
  /// In en, this message translates to:
  /// **'DUE SOON'**
  String get dashboardBadgeSoon;

  /// No description provided for @dashboardBadgePlanned.
  ///
  /// In en, this message translates to:
  /// **'PLANNED'**
  String get dashboardBadgePlanned;

  /// No description provided for @dashboardBadgeDone.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get dashboardBadgeDone;

  /// No description provided for @dashboardNavStatus.
  ///
  /// In en, this message translates to:
  /// **'STATUS'**
  String get dashboardNavStatus;

  /// No description provided for @dashboardNavCalendar.
  ///
  /// In en, this message translates to:
  /// **'CALENDAR'**
  String get dashboardNavCalendar;

  /// No description provided for @dashboardNavServices.
  ///
  /// In en, this message translates to:
  /// **'SERVICES'**
  String get dashboardNavServices;

  /// No description provided for @dashboardNavNotifications.
  ///
  /// In en, this message translates to:
  /// **'ALERTS'**
  String get dashboardNavNotifications;

  /// No description provided for @drawerMyProfile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get drawerMyProfile;

  /// No description provided for @drawerMyCars.
  ///
  /// In en, this message translates to:
  /// **'My vehicles'**
  String get drawerMyCars;

  /// No description provided for @drawerReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get drawerReminders;

  /// No description provided for @drawerSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get drawerSettings;

  /// No description provided for @drawerSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get drawerSignOut;

  /// No description provided for @drawerVersion.
  ///
  /// In en, this message translates to:
  /// **'CarHelper v1.0.0'**
  String get drawerVersion;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsSectionGeneral.
  ///
  /// In en, this message translates to:
  /// **'GENERAL SETTINGS'**
  String get settingsSectionGeneral;

  /// No description provided for @settingsSectionNotifications.
  ///
  /// In en, this message translates to:
  /// **'NOTIFICATIONS'**
  String get settingsSectionNotifications;

  /// No description provided for @settingsSectionData.
  ///
  /// In en, this message translates to:
  /// **'DATA & SYNC'**
  String get settingsSectionData;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Interface language'**
  String get settingsLanguageTitle;

  /// No description provided for @settingsLanguageValue.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageValue;

  /// No description provided for @settingsUnitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Units of measurement'**
  String get settingsUnitsTitle;

  /// No description provided for @settingsUnitsKm.
  ///
  /// In en, this message translates to:
  /// **'Kilometres, Litres'**
  String get settingsUnitsKm;

  /// No description provided for @settingsUnitsMiles.
  ///
  /// In en, this message translates to:
  /// **'Miles, Gallons'**
  String get settingsUnitsMiles;

  /// No description provided for @settingsThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsThemeTitle;

  /// No description provided for @settingsThemeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get settingsThemeDark;

  /// No description provided for @settingsThemeLight.
  ///
  /// In en, this message translates to:
  /// **'Light theme'**
  String get settingsThemeLight;

  /// No description provided for @settingsPushTitle.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get settingsPushTitle;

  /// No description provided for @settingsPushSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Important service reminders'**
  String get settingsPushSubtitle;

  /// No description provided for @settingsEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Email reports'**
  String get settingsEmailTitle;

  /// No description provided for @settingsEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly expense summary'**
  String get settingsEmailSubtitle;

  /// No description provided for @settingsSyncTitle.
  ///
  /// In en, this message translates to:
  /// **'Cloud sync'**
  String get settingsSyncTitle;

  /// No description provided for @settingsSyncSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Last sync: Today, 10:45'**
  String get settingsSyncSubtitle;

  /// No description provided for @settingsExportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export data'**
  String get settingsExportTitle;

  /// No description provided for @settingsExportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'PDF or CSV format'**
  String get settingsExportSubtitle;

  /// No description provided for @settingsFooterPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsFooterPrivacy;

  /// No description provided for @settingsFooterSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settingsFooterSupport;

  /// No description provided for @settingsFooterVersion.
  ///
  /// In en, this message translates to:
  /// **'VERSION 1.0.0 (BUILD 1)'**
  String get settingsFooterVersion;

  /// No description provided for @settingsFooterAppName.
  ///
  /// In en, this message translates to:
  /// **'CAR HELPER'**
  String get settingsFooterAppName;

  /// No description provided for @settingsUnitKm.
  ///
  /// In en, this message translates to:
  /// **'KM'**
  String get settingsUnitKm;

  /// No description provided for @settingsUnitMl.
  ///
  /// In en, this message translates to:
  /// **'MI'**
  String get settingsUnitMl;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileSectionPersonal.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get profileSectionPersonal;

  /// No description provided for @profileSectionSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profileSectionSettings;

  /// No description provided for @profileSectionAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profileSectionAccount;

  /// No description provided for @profileEditButton.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profileEditButton;

  /// No description provided for @profileSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profileSaveButton;

  /// No description provided for @profileCancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get profileCancelButton;

  /// No description provided for @profileFieldFirstName.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get profileFieldFirstName;

  /// No description provided for @profileFieldLastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get profileFieldLastName;

  /// No description provided for @profileFieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profileFieldEmail;

  /// No description provided for @profileHintFirstName.
  ///
  /// In en, this message translates to:
  /// **'John'**
  String get profileHintFirstName;

  /// No description provided for @profileHintLastName.
  ///
  /// In en, this message translates to:
  /// **'Doe'**
  String get profileHintLastName;

  /// No description provided for @profileUnitsTitle.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get profileUnitsTitle;

  /// No description provided for @profileUnitKm.
  ///
  /// In en, this message translates to:
  /// **'KM'**
  String get profileUnitKm;

  /// No description provided for @profileUnitMi.
  ///
  /// In en, this message translates to:
  /// **'MI'**
  String get profileUnitMi;

  /// No description provided for @profileChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get profileChangePassword;

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get profileSignOut;

  /// No description provided for @vehiclesTitle.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get vehiclesTitle;

  /// No description provided for @vehiclesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No vehicles yet. Add your first!'**
  String get vehiclesEmpty;

  /// No description provided for @vehiclesMileageFormat.
  ///
  /// In en, this message translates to:
  /// **'{year} • {mileage} km'**
  String vehiclesMileageFormat(int year, int mileage);

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notificationsEmpty;

  /// No description provided for @maintenanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Works'**
  String get maintenanceTitle;

  /// No description provided for @calendarTitle.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarTitle;

  /// No description provided for @networkErrorNoConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get networkErrorNoConnection;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
