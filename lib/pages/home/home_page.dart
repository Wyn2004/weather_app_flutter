import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/home/widgets/home_detail_weather.dart';
import 'package:weather_app/pages/home/widgets/home_location.dart';
import 'package:weather_app/pages/home/widgets/home_weather_icon.dart';
import 'package:weather_app/pages/home/widgets/home_temperature.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }

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
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'No data available',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            WeatherData data = snapshot.data as WeatherData;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeWeatherIcon(weatherIcon: data.listWeather[0].main),
                HomeTemperature(temperature: data.base.temp),
                HomeLocation(location: data.name),
                SizedBox(height: 40),
                HomeDetailWeather(
                  wind: data.wind.speed,
                  humidity: data.base.humidity,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
