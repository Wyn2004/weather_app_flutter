import 'package:flutter/material.dart';
import 'package:weather_app/pages/home/widgets/home_detail_weather.dart';
import 'package:weather_app/pages/home/widgets/home_location.dart';
import 'package:weather_app/pages/home/widgets/home_weather_icon.dart';
import 'package:weather_app/pages/home/widgets/home_temperature.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // define container and color
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeWeatherIcon(),
            HomeTemperature(),
            HomeLocation(),
            SizedBox(height: 40),
            HomeDetailWeather(),
          ],
        ),
      ),
    );
  }
}
