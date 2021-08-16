// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/multi_language/translate_helper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Text(
          TranslateHelper.of(context).translate('weather'),
          style: AppTextStyles.headline1.copyWith(
            color: context.colors.text,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
