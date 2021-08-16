// Cores
import 'dart:async';
import 'package:bloc/bloc.dart';
// Blocs
import 'package:flutter_bloc_boilerplate/blocs/app_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/language/bloc.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/flavor_settings_service.dart';
import 'package:flutter_bloc_boilerplate/services/shared_preferences_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';
// Bloc
import './bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitialApplicationState());

  @override
  Stream<ApplicationState> mapEventToState(event) async* {
    if (event is OnSetupApplication) {
      // Init flavor settings and preferences
      await FlavorSettingsService.setFlavorSettings();
      await SharedPreferencesServices().initPrefInstance();

      /// Get old Language
      final oldLanguage =
          SharedPreferencesServices.getString(Preferences.language);

      /// Setup Language
      if (oldLanguage != null) {
        AppBloc.languageBloc.add(
          OnChangeLanguage(Locale(oldLanguage)),
        );
      }

      // Splash time is displayed
      await Future.delayed(Duration(milliseconds: 2000));

      yield ApplicationCompleted();
    }
  }
}
