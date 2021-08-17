// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/app_images.dart';
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Image.asset(
          AppImages.weather,
          scale: 2,
        ),
      ),
    );
  }
}
