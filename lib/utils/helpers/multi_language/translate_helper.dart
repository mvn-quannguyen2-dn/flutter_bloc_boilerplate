import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/multi_language/app_locale_delegate.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class TranslateHelper {
  final Locale locale;

  TranslateHelper(this.locale);

  static TranslateHelper of(BuildContext context) {
    return Localizations.of<TranslateHelper>(context, TranslateHelper)!;
  }

  static const LocalizationsDelegate<TranslateHelper> delegate =
      AppLocaleDelegate();

  late Map<String, String> _localizedStrings;

  Future<bool> load() async {
    final jsonMap = await AssetHelper.loadJson(
      'assets/locale/${locale.languageCode}.json',
    );

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}
