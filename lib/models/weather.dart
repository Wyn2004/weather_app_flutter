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
  final double feels_like;
  final double temp_min;
  final double temp_max;
  final int humidity;
  Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feel_like': feels_like,
      'temp_min': temp_min,
      'temp_max': temp_max,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: (map['temp'] as num).toDouble(),
      feels_like: (map['feels_like'] as num).toDouble(),
      temp_min: (map['temp_min'] as num).toDouble(),
      temp_max: (map['temp_max'] as num).toDouble(),
      humidity: map['humidity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) =>
      Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Wind {
  final double speed;
  final int deg;
  final double? gust;
  Wind({required this.speed, required this.deg, this.gust});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'speed': speed, 'deg': deg, 'gust': gust};
  }

  factory Wind.fromMap(Map<String, dynamic> map) {
    return Wind(
      speed: (map['speed'] as num).toDouble(),
      deg: map['deg'] as int,
      gust: map['gust'] != null ? (map['gust'] as num).toDouble() : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) =>
      Wind.fromMap(json.decode(source) as Map<String, dynamic>);
}

class City {
  final int id;
  final String name;
  final String country;

  City({required this.id, required this.name, required this.country});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'country': country};
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'] as int,
      name: map['name'] as String,
      country: map['country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory City.fromJson(String source) =>
      City.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherData {
  final int id;
  final List<Weather> listWeather;
  final Main base;
  final int visibility;
  final Wind wind;
  final String name;
  int? cod;

  WeatherData({
    required this.id,
    required this.listWeather,
    required this.base,
    required this.visibility,
    required this.wind,
    required this.name,
    this.cod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'listWeather': listWeather.map((x) => x.toMap()).toList(),
      'base': base.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'name': name,
      'cod': cod,
    };
  }

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      id: map['id'] as int,
      listWeather:
          (map['weather'] as List<dynamic>? ?? [])
              .map<Weather>((x) => Weather.fromMap(x as Map<String, dynamic>))
              .toList(),
      base: Main.fromMap(map['main'] as Map<String, dynamic>),
      visibility: map['visibility'] as int,
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      name: map['name'] as String,
      cod: map['cod'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class WeatherDetail {
  final List<Weather> listWeather;
  final Main main;
  final Wind wind;
  final String dt_txt;

  WeatherDetail({
    required this.listWeather,
    required this.main,
    required this.wind,
    required this.dt_txt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listWeather': listWeather.map((x) => x.toMap()).toList(),
      'main': main.toMap(),
      'wind': wind.toMap(),
      'dt_txt': dt_txt,
    };
  }

  factory WeatherDetail.fromMap(Map<String, dynamic> map) {
    return WeatherDetail(
      listWeather:
          (map['weather'] as List<dynamic>? ?? [])
              .map<Weather>((x) => Weather.fromMap(x as Map<String, dynamic>))
              .toList(),
      main: Main.fromMap(map['main'] as Map<String, dynamic>),
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      dt_txt: map['dt_txt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherDetail.fromJson(String source) =>
      WeatherDetail.fromMap(json.decode(source) as Map<String, dynamic>);
}
