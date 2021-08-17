// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/helpers/index.dart';
// Widgets
import 'package:flutter_bloc_boilerplate/views/widgets/home/weather_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            WeatherCard(
              temperature: 35,
              weatherSituation: 'Partly sunny',
              humidity: 0,
            ),
          ],
        ),
      ),
    );
  }
}
