// Cores
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
      locale: AppLanguageHelper.defaultLanguage,
      localizationsDelegates: [
        TranslateHelper.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLanguageHelper.supportLanguage,
    );
  }
}
