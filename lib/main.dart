// Cores
import 'package:flutter/material.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/flavor_settings_service.dart';

Future<void> main() async {
  // NOTE: This is required for accessing the method channel before runApp().
  WidgetsFlutterBinding.ensureInitialized();
  await FlavorSettingsService.setFlavorSettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Boilerplate',
      home: TextButton(
        child: Text('Show Flavor'),
        onPressed: () async {
          print(FlavorSettingsService.getFlavorSettings().apiBaseUrl);
        },
      ),
    );
  }
}
