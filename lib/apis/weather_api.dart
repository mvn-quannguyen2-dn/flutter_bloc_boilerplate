// Models
import 'package:flutter_bloc_boilerplate/models/weather_hourly_forecasrs.dart';
// Services
import 'package:flutter_bloc_boilerplate/services/dio_service.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';

class WeatherApi {
  static Future<WeatherHourlyForecasrs> getHourlyForecasts() async {
    final dataWaether = await DioService().requestHttpClient(
      DioParam(
        fullPath: ApiResource.urlGetWeather,
      ),
    );
    return WeatherHourlyForecasrs.fromJson(dataWaether.data.first);
  }
}
