import 'package:dio/dio.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/apps/utils/const.dart';

class ApiRepository {
  static final String urlGetWeather =
      'https://api.openweathermap.org/data/2.5/weather?lat=10.842944&lon=106.837314&units=metric&appid=${MyKey.apiKey}';
  static final String urlGetWeatherDetail =
      'https://api.openweathermap.org/data/2.5/forecast?lat=10.842944&lon=106.837314&units=metric&appid=${MyKey.apiKey}';

  static Future<WeatherData> callApiGetWeather() async {
    final dio = Dio();
    try {
      final response = await dio.get(urlGetWeather);
      final data = response.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    final dio = Dio();
    try {
      final response = await dio.get(urlGetWeatherDetail);
      final data = response.data['list'];
      List<WeatherDetail> result = List.from(
        data.map((item) => WeatherDetail.fromMap(item)).toList(),
      );
      return result;
    } catch (e) {
      print("123123: $e");
      throw Exception('Failed to load weather data: $e');
    }
  }
}
