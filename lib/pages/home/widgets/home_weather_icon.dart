import 'package:flutter/material.dart';
import 'package:weather_app/apps/utils/const.dart';

class HomeWeatherIcon extends StatelessWidget {
  final String weatherIcon;
  const HomeWeatherIcon({super.key, required this.weatherIcon});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      width: Size.width / 1.3,
      padding: EdgeInsets.all(20.0),
      child: Image.asset(AssesCustom.getLinkImage(weatherIcon)),
    );
  }
}
