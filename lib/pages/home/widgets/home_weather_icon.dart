import 'package:flutter/material.dart';

class HomeWeatherIcon extends StatelessWidget {
  const HomeWeatherIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      width: Size.width / 1.3,
      padding: EdgeInsets.all(20.0),
      child: Image.asset('assets/images/weathers/lightdrizzle.png'),
    );
  }
}
