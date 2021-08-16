// Cores
import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHelper.of(context).translate('settings'),
        ),
      ),
      body: Container(),
    );
  }
}
