import 'dart:convert';

import 'package:http/http.dart' as http;

enum WeatherAPIRoute { current, forecast }

extension WeatherAPIRouteExtension on WeatherAPIRoute {
  String get name {
    switch (this) {
      case WeatherAPIRoute.current:
        return 'weather';
      case WeatherAPIRoute.forecast:
        return 'forecast';
    }
  }
}

class WeatherAPI {
  static String baseUrl(WeatherAPIRoute route) =>
      'https://api.openweathermap.org/data/2.5/${route.name}?units=metric&mode=metric';

  final String apiKey;
  final http.Client? client;

  const WeatherAPI(this.apiKey, {this.client});

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    http.Client client = this.client ?? http.Client();

    http.Response response = await client.get(
      Uri.parse(
          '${baseUrl(WeatherAPIRoute.current)}&q=$cityName&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to fetch weather data for $cityName: ${response.statusCode}',
      );
    }
  }

  Future<Map<String, dynamic>> fetchForecastWeather(String cityName) async {
    http.Client client = this.client ?? http.Client();

    http.Response response = await client.get(Uri.parse(
      '${baseUrl(WeatherAPIRoute.forecast)}&q=$cityName&appid=$apiKey',
    ));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to fetch forecast weather data for $cityName: ${response.statusCode}',
      );
    }
  }
}
