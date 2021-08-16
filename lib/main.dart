// Cores
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
// App
import 'package:flutter_bloc_boilerplate/app.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    LoggerHelper.log('BLOC CREATE', bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LoggerHelper.log('BLOC CHANGE', change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerHelper.log('BLOC ERROR', stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    LoggerHelper.log('BLOC CLOSE', bloc);
  }
}

Future<void> main() async {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
