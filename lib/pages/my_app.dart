import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
