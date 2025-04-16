import 'package:flutter/material.dart';

class HomeTemperature extends StatelessWidget {
  final double temperature;
  final int fontSize;
  const HomeTemperature({
    super.key,
    required this.temperature,
    this.fontSize = 100,
  });

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
            fontSize: fontSize.toDouble(),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "°",
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize.toDouble() / 3,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
