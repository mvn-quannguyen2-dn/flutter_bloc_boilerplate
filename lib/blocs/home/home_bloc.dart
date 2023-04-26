// Cores
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// Apis
import 'package:flutter_bloc_boilerplate/apis/weather_api.dart';
// Bloc
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(LoadingApiState());

  @override
  Stream<HomeState> mapEventToState(event) async* {
    if (event is OnInitPage) {
      try {
        final weather = await WeatherApi.getHourlyForecasts();
        // Convert the temperature unit F to C
        final temperature = ((weather.temperature?.value ?? 0) - 32) / 1.8;
        yield ApiWeatherSuccess(
          temperature: temperature.toInt(),
          weatherSituation: weather.iconPhrase ?? '',
          humidity: weather.precipitationProbability ?? 0,
        );
        return;
      } on DioError catch (_) {
        yield ApiWeatherFail();
      }
      yield LoadingApiState();
    }
  }
}
