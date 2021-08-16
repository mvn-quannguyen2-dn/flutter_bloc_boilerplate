// Cores
import 'dart:async';
import 'package:bloc/bloc.dart';
// Blocs
import 'package:flutter_bloc_boilerplate/blocs/app_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/language/bloc.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/shared_preferences_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';
// Index
import 'bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(InitialApplicationState());

  @override
  Stream<ApplicationState> mapEventToState(event) async* {
    if (event is OnSetupApplication) {
      ///Get old Language
      final oldLanguage =
          SharedPreferencesServices.getString(Preferences.language);

      ///Setup Language
      if (oldLanguage != null) {
        AppBloc.languageBloc.add(
          OnChangeLanguage(Locale(oldLanguage)),
        );
      }
      yield ApplicationCompleted();
    }
  }
}
