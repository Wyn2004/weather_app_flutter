// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  final int id;
  final String main;
  final String description;

  Weather({required this.id, required this.main, required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] as int,
      main: map['main'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Main {
  final double temp;
  final double feel_like;
  final double temp_min;
  final double temp_max;
  Main({
    required this.temp,
    required this.feel_like,
    required this.temp_min,
    required this.temp_max,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feel_like': feel_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] as double,
      feel_like: map['feel_like'] as double,
      temp_min: map['temp_min'] as double,
      temp_max: map['temp_max'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wind {
  final double speed;
  final int deg;
  final double gust;
  Wind({required this.speed, required this.deg, required this.gust});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'speed': speed, 'deg': deg, 'gust': gust};
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: map['speed'] as double,
      deg: map['deg'] as int,
      gust: map['gust'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherData {
  final int id;
  final List<Weather> listWeather;
  final Main base;
  final int visibility;
  final Wind wind;
  final String name;
  WeatherData({
    required this.id,
    required this.listWeather,
    required this.base,
    required this.visibility,
    required this.wind,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'listWeather': listWeather.map((x) => x.toMap()).toList(),
      'base': base.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'name': name,
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: map['id'] as int,
      listWeather: List<Weather>.from(
        (map['listWeather'] as List<int>).map<Weather>(
          (x) => Weather.fromMap(x as Map<String, dynamic>),
        ),
      ),
      base: Main.fromMap(map['base'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}
