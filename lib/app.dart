// Cores
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Routes
import 'package:flutter_bloc_boilerplate/routes/route_app.dart';
// Blocs
import 'package:flutter_bloc_boilerplate/blocs/app_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/export_blocs.dart';
// Views
import 'package:flutter_bloc_boilerplate/bottom_navigation.dart';
import 'package:flutter_bloc_boilerplate/views/pages/splash/splash_page.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final routeApp = RouteApp();

  @override
  void initState() {
    AppBloc.applicationBloc.add(OnSetupApplication());
    super.initState();
  }

  @override
  void dispose() {
    AppBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBloc.providers,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, lang) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(Brightness.light),
            darkTheme: getAppTheme(Brightness.dark),
            onGenerateRoute: routeApp.generateRoute,
            locale: AppLanguageHelper.defaultLanguage,
            localizationsDelegates: [
              TranslateHelper.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLanguageHelper.supportLanguage,
            home: BlocBuilder<ApplicationBloc, ApplicationState>(
              builder: (context, application) {
                if (application is ApplicationCompleted) {
                  return BottomNavigation();
                }
                return SplashPage();
              },
            ),
          );
        },
      ),
    );
  }
}
