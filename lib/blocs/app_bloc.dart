// Cores
import 'package:flutter_bloc/flutter_bloc.dart';
// Import all bloc
import './export_blocs.dart';

class AppBloc {
  static final applicationBloc = ApplicationBloc();
  static final languageBloc = LanguageBloc();
  static final appStateBloc = AppStateBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<LanguageBloc>(
      create: (context) => languageBloc,
    ),
    BlocProvider<AppStateBloc>(
      create: (context) => appStateBloc,
    ),
  ];

  static void dispose() {
    applicationBloc.close();
    languageBloc.close();
    appStateBloc.close();
  }

  /// Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
