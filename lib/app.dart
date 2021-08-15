// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(Brightness.light),
      darkTheme: getAppTheme(Brightness.dark),
    );
  }
}
