// Cores
import 'dart:async';
import 'package:bloc/bloc.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/shared_preferences_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/preferences.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';
// Bloc
import './bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(InitialLanguageState());

  @override
  Stream<LanguageState> mapEventToState(event) async* {
    if (event is OnChangeLanguage) {
      if (event.locale == AppLanguageHelper.defaultLanguage) {
        yield LanguageUpdated();
      } else {
        yield LanguageUpdating();
        AppLanguageHelper.defaultLanguage = event.locale;

        await SharedPreferencesServices.setString(
          Preferences.language,
          event.locale.languageCode,
        );

        yield LanguageUpdated();
      }
    }
  }
}
