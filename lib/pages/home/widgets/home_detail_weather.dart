import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  final double wind;
  final int humidity;
  const HomeDetailWeather({
    super.key,
    required this.wind,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/wind.png'),
            Text(
              '$wind km/h',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/water.png'),
            Text(
              '$humidity %',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
