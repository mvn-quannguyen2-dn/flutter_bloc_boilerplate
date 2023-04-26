abstract class HomeState {}

class LoadingApiState extends HomeState {}

class ApiWeatherFail extends HomeState {}

class ApiWeatherSuccess extends HomeState {
  final int temperature;
  final String weatherSituation;
  final int humidity;
  ApiWeatherSuccess({
    required this.temperature,
    required this.weatherSituation,
    required this.humidity,
  });
}
