// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.accent,
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}
