import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  final double temperature;
  const HomeTemperature({super.key, required this.temperature});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temperature.round().toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 100,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "°",
          style: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
