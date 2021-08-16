// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class AppLocaleDelegate extends LocalizationsDelegate<TranslateHelper> {
  const AppLocaleDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLanguageHelper.supportLanguage.contains(locale);
  }

  @override
  Future<TranslateHelper> load(Locale locale) async {
    final localizations = TranslateHelper(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocaleDelegate old) => false;
}
