import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // NOTE: This is required for accessing the method channel before runApp().
  WidgetsFlutterBinding.ensureInitialized();
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
          final flavor = await const MethodChannel('flavor')
              .invokeMethod<String>('getFlavor');
          print(flavor);
        },
      ),
    );
  }
}
