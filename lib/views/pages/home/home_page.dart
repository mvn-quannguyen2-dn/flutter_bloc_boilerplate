// Cores
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Blocs
import 'package:flutter_bloc_boilerplate/blocs/app_bloc.dart';
import 'package:flutter_bloc_boilerplate/blocs/export_blocs.dart';
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
  void initState() {
    super.initState();
    AppBloc.homeBloc.add(OnInitPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslateHelper.of(context).translate('home'),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingApiState) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 2,
              ),
            );
          }
          if (state is ApiWeatherSuccess) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  WeatherCard(
                    temperature: state.temperature,
                    weatherSituation: state.weatherSituation,
                    humidity: state.humidity,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
