// Cores
import 'package:flutter/material.dart';
// Utils
import 'package:flutter_bloc_boilerplate/utils/constants/app_images.dart';
import 'package:flutter_bloc_boilerplate/utils/constants/index.dart';

class WeatherCard extends StatelessWidget {
  final int temperature;
  final String weatherSituation;
  final int humidity;

  const WeatherCard({
    required this.temperature,
    required this.weatherSituation,
    required this.humidity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: double.infinity,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppImages.weather,
                    width: 120,
                    height: 120,
                  ),
                  Positioned(
                    top: 50,
                    left: 40,
                    child: Text(
                      '$temperature°',
                      style: AppTextStyles.headline1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                weatherSituation,
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Icon(
                    Icons.invert_colors,
                    color: Colors.grey,
                  ),
                  Text(
                    '$humidity%',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
