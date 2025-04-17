import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Position? position;
  String nameCity = 'Ho Chi Minh';

  updatePosition(Position newPosition) {
    position = newPosition;
    notifyListeners();
  }

  Future<WeatherData> getWeatherCurrent() async {
    if (position == null) {
      throw Exception('Position is not set');
    }
    final response = await ApiRepository.callApiGetWeather(position!);
    nameCity = response.name;
    notifyListeners();
    return response;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    if (position == null) {
      throw Exception('Position is not set');
    }
    final response = await ApiRepository.callApiGetWeatherDetail(position!);
    return response;
  }
}
