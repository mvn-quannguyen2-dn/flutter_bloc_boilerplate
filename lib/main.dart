// Cores
import 'package:flutter/material.dart';
// App
import 'package:flutter_bloc_boilerplate/app.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/flavor_settings_service.dart';
import 'package:flutter_bloc_boilerplate/services/shared_preferences_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';

Future<void> main() async {
  // NOTE: This is required for accessing the method channel before runApp().
  WidgetsFlutterBinding.ensureInitialized();
  await FlavorSettingsService.setFlavorSettings();
  await SharedPreferencesServices().initPrefInstance();
  runApp(App());
}
