import '../domain/model/auth_error_keys.dart';
import '../../../shared/l10n/l10n_extension.dart';

extension AuthErrorL10n on AppLocalizations {
  String translateAuthError(String key) => switch (key) {
        AuthErrorKeys.network => authErrorNetwork,
        AuthErrorKeys.invalidCredentials => authErrorInvalidCredentials,
        AuthErrorKeys.alreadyRegistered => authErrorAlreadyRegistered,
        AuthErrorKeys.emailNotConfirmed => authErrorEmailNotConfirmed,
        AuthErrorKeys.unknown => authErrorUnknown,
        _ => key,
      };
}
