import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/detail/widgets/detail_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: FutureBuilder(
        future: context.read<WeatherProvider>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading weather data"));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          List<WeatherDetail> weatherDetails =
              snapshot.data as List<WeatherDetail>;

          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Icon(CupertinoIcons.location, size: 30),
                  SizedBox(width: 15),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        context.read<WeatherProvider>().nameCity,
                        speed: Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(CupertinoIcons.search),
                  onPressed: () {},
                ),
                SizedBox(width: 10),
              ],
            ),
            body: DetailBody(weatherDetails: weatherDetails),
          );
        },
      ),
    );
  }
}
