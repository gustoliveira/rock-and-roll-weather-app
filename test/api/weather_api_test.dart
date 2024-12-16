import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';

import '../mocks/mock_http_client.mocks.dart';

void main() {
  const String apiKey = 'my_test_api_key';
  const String forecastBaseUrl =
      'https://api.openweathermap.org/data/2.5/forecast?units=metric&mode=metric';

  final MockClient mockClient = MockClient();
  final WeatherAPI weatherApi = WeatherAPI(apiKey, client: mockClient);

  group('fetchForecastWeather', () {
    test('returns decoded JSON when the HTTP call completes successfully',
        () async {
      const cityName = 'London';
      final mockResponse = {
        'list': [
          {
            'dt': 1620123456,
            'main': {'temp': 20.5}
          }
        ],
        'city': {'name': cityName, 'country': 'UK'}
      };

      when(mockClient.get(
        Uri.parse('$forecastBaseUrl&q=$cityName&appid=$apiKey'),
      )).thenAnswer((_) async => http.Response(jsonEncode(mockResponse), 200));

      final result = await weatherApi.fetchForecastWeather(cityName);

      expect(result, mockResponse);
    });

    test('throws an exception when the HTTP call fails', () async {
      const cityName = 'InvalidCity';

      when(mockClient.get(
        Uri.parse('$forecastBaseUrl&q=$cityName&appid=$apiKey'),
      )).thenAnswer(
        (_) async => http.Response('Not Found', 404),
      );

      expect(
        () => weatherApi.fetchForecastWeather(cityName),
        throwsException,
      );
    });
  });

  group('WeatherAPIRouteExtension Tests', () {
    test('WeatherAPIRoute.current returns "weather"', () {
      const route = WeatherAPIRoute.current;
      expect(route.name, 'weather');
    });

    test('WeatherAPIRoute.forecast returns "forecast"', () {
      const route = WeatherAPIRoute.forecast;
      expect(route.name, 'forecast');
    });
  });
}
