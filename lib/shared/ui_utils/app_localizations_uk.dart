// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'CarMaintenance';

  @override
  String get errorNetwork =>
      'Помилка мережі. Перевірте підключення до інтернету.';

  @override
  String get errorCache => 'Помилка читання локальних даних.';

  @override
  String get errorAuth => 'Помилка авторизації. Увійдіть знову.';

  @override
  String get errorNotFound => 'Дані не знайдено.';

  @override
  String get errorUnknown => 'Невідома помилка. Спробуйте ще раз.';

  @override
  String get retry => 'Повторити';

  @override
  String get cancel => 'Скасувати';

  @override
  String get save => 'Зберегти';

  @override
  String get delete => 'Видалити';

  @override
  String get edit => 'Редагувати';

  @override
  String get add => 'Додати';

  @override
  String get loading => 'Завантаження...';

  @override
  String get navHome => 'Головна';

  @override
  String get navWorks => 'Роботи';

  @override
  String get navCalendar => 'Календар';

  @override
  String get navNotifications => 'Сповіщення';

  @override
  String get navProfile => 'Профіль';

  @override
  String get statusOk => 'OK';

  @override
  String get statusSoon => 'Скоро';

  @override
  String get statusOverdue => 'Прострочено';

  @override
  String get splashTagline => 'Ваш розумний помічник\nдля обслуговування авто';

  @override
  String get onboardingSlide1StepLabel => '01 / 03';

  @override
  String get onboardingSlide1Title => 'Плануйте технічне\nобслуговування';

  @override
  String get onboardingSlide1Description =>
      'Додавайте роботи, отримуйте нагадування про заміну масла, фільтрів та ременя ГРМ вчасно.';

  @override
  String get onboardingSlide2StepLabel => '02 / 03';

  @override
  String get onboardingSlide2Title => 'Керуйте кількома\nавтомобілями';

  @override
  String get onboardingSlide2Description =>
      'Додавайте декілька авто та швидко перемикайтесь між ними прямо з головного меню.';

  @override
  String get onboardingSlide3StepLabel => '03 / 03';

  @override
  String get onboardingSlide3Title => 'Працює офлайн та\nсинхронізується';

  @override
  String get onboardingSlide3Description =>
      'Ваша історія доступна без інтернету. Дані автоматично синхронізуються при підключенні.';

  @override
  String get onboardingButtonNext => 'Далі →';

  @override
  String get onboardingButtonStart => 'Розпочати →';

  @override
  String get onboardingButtonSkip => 'Пропустити';

  @override
  String get labelEmail => 'Електронна пошта';

  @override
  String get hintEmail => 'ім\'я@приклад.com';

  @override
  String get labelPassword => 'Пароль';

  @override
  String get labelFirstName => 'Ім\'я';

  @override
  String get hintFirstName => 'Іван';

  @override
  String get labelLastName => 'Прізвище';

  @override
  String get hintLastName => 'Іванов';

  @override
  String get labelConfirmPassword => 'Підтвердити пароль';

  @override
  String get validationEmailRequired => 'Введіть email';

  @override
  String get validationEmailInvalid => 'Невірний формат email';

  @override
  String get validationPasswordRequired => 'Введіть пароль';

  @override
  String get validationPasswordMinLength =>
      'Пароль має містити мінімум 8 символів';

  @override
  String get validationPasswordsMismatch => 'Паролі не збігаються';

  @override
  String get validationFirstNameRequired => 'Введіть ім\'я';

  @override
  String get authOrContinueWith => 'АБО ПРОДОВЖИТИ З';

  @override
  String get loginTitle => 'Вхід';

  @override
  String get loginSubtitle => 'Введіть ваші дані для доступу до акаунту.';

  @override
  String get loginForgotPassword => 'Забули пароль?';

  @override
  String get loginButton => 'Увійти →';

  @override
  String get loginNoAccount => 'Немає акаунту? ';

  @override
  String get loginSignUpLink => 'Зареєструватися';

  @override
  String get signUpTitle => 'Реєстрація';

  @override
  String get signUpSubtitle =>
      'Створіть акаунт для керування вашим автомобілем та отримання сповіщень.';

  @override
  String get signUpButton => 'Зареєструватися →';

  @override
  String get signUpHasAccount => 'Вже є акаунт? ';

  @override
  String get signUpSignInLink => 'Увійти';

  @override
  String get forgotPasswordTitle => 'Відновлення пароля';

  @override
  String get forgotPasswordSubtitle =>
      'Введіть вашу електронну пошту — ми надішлемо посилання для скидання пароля.';

  @override
  String get forgotPasswordBack => '← Повернутися до входу';

  @override
  String get forgotPasswordButton => 'Надіслати посилання →';

  @override
  String get forgotPasswordTlsNote => 'ЗАШИФРОВАНО ЗА ДОПОМОГОЮ TLS 1.3';

  @override
  String get forgotPasswordSuccessTitle => 'Перевірте пошту';

  @override
  String forgotPasswordSuccessMessage(String email) {
    return 'Посилання для відновлення пароля надіслано на $email. Перевірте вашу поштову скриньку.';
  }

  @override
  String get forgotPasswordSuccessMessageNoEmail =>
      'Посилання для відновлення пароля надіслано. Перевірте вашу поштову скриньку.';

  @override
  String get forgotPasswordBackToLogin => 'Повернутися до входу';

  @override
  String get authErrorNetwork =>
      'Помилка мережі. Перевірте підключення до інтернету';

  @override
  String get authErrorInvalidCredentials => 'Невірний email або пароль';

  @override
  String get authErrorAlreadyRegistered => 'Акаунт з таким email вже існує';

  @override
  String get authErrorEmailNotConfirmed => 'Підтвердьте вашу email-адресу';

  @override
  String get authErrorUnknown => 'Щось пішло не так. Спробуйте ще раз пізніше';

  @override
  String get splashVersion => 'ВЕРСІЯ 2.4.0';

  @override
  String get splashAppName => 'CarHelper';

  @override
  String get dashboardTitle => 'Статус автомобіля';

  @override
  String get dashboardSelectedCar => 'ОБРАНИЙ АВТОМОБІЛЬ';

  @override
  String get dashboardCurrentMileage => 'ПОТОЧНИЙ ПРОБІГ';

  @override
  String get dashboardMileageUnit => 'км';

  @override
  String get dashboardAddService => 'ДОДАТИ СЕРВІС';

  @override
  String get dashboardAddWork => 'ЗАПИСАТИ РОБОТУ';

  @override
  String get dashboardCarHealth => 'Стан автомобіля';

  @override
  String get dashboardRecentServices => 'ОСТАННІ СЕРВІСИ';

  @override
  String get dashboardViewAll => 'ПЕРЕГЛЯНУТИ ВСЕ';

  @override
  String get dashboardBadgeSoon => 'СКОРО ТЕРМІН';

  @override
  String get dashboardBadgePlanned => 'ПЛАНОВО';

  @override
  String get dashboardBadgeDone => 'ВИКОНАНО';

  @override
  String get dashboardNavStatus => 'СТАТУС';

  @override
  String get dashboardNavCalendar => 'КАЛЕНДАР';

  @override
  String get dashboardNavServices => 'СЕРВІСИ';

  @override
  String get dashboardNavNotifications => 'СПОВІЩЕННЯ';

  @override
  String get drawerMyProfile => 'Мій профіль';

  @override
  String get drawerMyCars => 'Мої автомобілі';

  @override
  String get drawerReminders => 'Нагадування';

  @override
  String get drawerSettings => 'Налаштування';

  @override
  String get drawerSignOut => 'Вийти';

  @override
  String get drawerVersion => 'CarHelper v1.0.0';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get settingsSectionGeneral => 'ЗАГАЛЬНІ НАЛАШТУВАННЯ';

  @override
  String get settingsSectionNotifications => 'СПОВІЩЕННЯ';

  @override
  String get settingsSectionData => 'ДАНІ ТА СИНХРОНІЗАЦІЯ';

  @override
  String get settingsLanguageTitle => 'Мова інтерфейсу';

  @override
  String get settingsLanguageValue => 'Українська';

  @override
  String get settingsUnitsTitle => 'Одиниці вимірювання';

  @override
  String get settingsUnitsKm => 'Кілометри, Літри';

  @override
  String get settingsUnitsMiles => 'Милі, Галони';

  @override
  String get settingsThemeTitle => 'Зовнішній вигляд';

  @override
  String get settingsThemeDark => 'Темна тема';

  @override
  String get settingsThemeLight => 'Світла тема';

  @override
  String get settingsPushTitle => 'Пуш-сповіщення';

  @override
  String get settingsPushSubtitle => 'Важливі сервісні нагадування';

  @override
  String get settingsEmailTitle => 'Email-звіти';

  @override
  String get settingsEmailSubtitle => 'Щомісячний аналіз витрат';

  @override
  String get settingsSyncTitle => 'Хмарна синхронізація';

  @override
  String get settingsSyncSubtitle => 'Остання синхронізація: Сьогодні, 10:45';

  @override
  String get settingsExportTitle => 'Експорт даних';

  @override
  String get settingsExportSubtitle => 'PDF або CSV формат';

  @override
  String get settingsFooterPrivacy => 'Конфіденційність';

  @override
  String get settingsFooterSupport => 'Підтримка';

  @override
  String get settingsFooterVersion => 'ВЕРСІЯ 1.0.0 (ЗБІРКА 1)';

  @override
  String get settingsFooterAppName => 'CAR HELPER';

  @override
  String get settingsUnitKm => 'КМ';

  @override
  String get settingsUnitMl => 'МЛ';

  @override
  String get profileTitle => 'Профіль';

  @override
  String get profileSectionPersonal => 'Особиста інформація';

  @override
  String get profileSectionSettings => 'Налаштування';

  @override
  String get profileSectionAccount => 'Акаунт';

  @override
  String get profileEditButton => 'Редагувати';

  @override
  String get profileSaveButton => 'Зберегти';

  @override
  String get profileCancelButton => 'Скасувати';

  @override
  String get profileFieldFirstName => 'Ім\'я';

  @override
  String get profileFieldLastName => 'Прізвище';

  @override
  String get profileFieldEmail => 'Email';

  @override
  String get profileHintFirstName => 'Іван';

  @override
  String get profileHintLastName => 'Іванов';

  @override
  String get profileUnitsTitle => 'Одиниці виміру';

  @override
  String get profileUnitKm => 'КМ';

  @override
  String get profileUnitMi => 'МИ';

  @override
  String get profileChangePassword => 'Змінити пароль';

  @override
  String get profileSignOut => 'Вийти з акаунту';

  @override
  String get vehiclesTitle => 'Автомобілі';

  @override
  String get vehiclesEmpty => 'Немає авто. Додайте перше!';

  @override
  String vehiclesMileageFormat(int year, int mileage) {
    return '$year • $mileage км';
  }

  @override
  String get notificationsTitle => 'Сповіщення';

  @override
  String get notificationsEmpty => 'Немає сповіщень';

  @override
  String get maintenanceTitle => 'Роботи';

  @override
  String get calendarTitle => 'Kalendar';

  @override
  String get networkErrorNoConnection => 'Немає підключення до інтернету';
}
