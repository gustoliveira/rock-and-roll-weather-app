import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherAPI {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather?units=metric&mode=metric';

  final String apiKey;
  final http.Client? client;

  const WeatherAPI(this.apiKey, {this.client});

  Future<Map<String, dynamic>> fetchWeather(String cityName) async {
    http.Client client = this.client ?? http.Client();

    http.Response response = await client.get(
      Uri.parse('$baseUrl&q=$cityName&appid=$apiKey'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'Failed to fetch weather data for $cityName: ${response.statusCode}',
      );
    }
  }
}
