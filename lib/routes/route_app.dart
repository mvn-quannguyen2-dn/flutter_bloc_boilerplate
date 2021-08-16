// Cores
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteApp {
  static const String home = '/home';
  static const String settings = '/settings';
  static const String sample = '/sample';

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Case sample:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return Sample();
      //     },
      //   );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Not Found'),
              ),
              body: Center(
                child: Text('No path for ${settings.name}'),
              ),
            );
          },
        );
    }
  }

  static final RouteApp _instance = RouteApp._internal();

  factory RouteApp() {
    return _instance;
  }

  RouteApp._internal();
}
