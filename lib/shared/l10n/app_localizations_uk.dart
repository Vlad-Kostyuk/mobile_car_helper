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
}
