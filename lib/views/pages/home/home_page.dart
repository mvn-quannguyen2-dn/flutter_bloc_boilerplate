// Cores
import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHelper.of(context).translate('home'),
        ),
      ),
      body: Container(),
    );
  }
}
