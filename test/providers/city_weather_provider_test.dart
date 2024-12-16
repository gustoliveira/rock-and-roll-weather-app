import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

import '../mocks/mock_http_client.mocks.dart';
import '../resources/current_weather_response_non_authorized_string.dart';
import '../resources/current_weather_response_string.dart';
import '../resources/forecast_weather_response_string.dart';

void main() {
  final MockClient client = MockClient();

  final String weatherMockUrl =
      'https://api.openweathermap.org/data/2.5/weather?units=metric&mode=metric&q=Silverstone&appid=my_very_secret_key';

  final String forecastMockUrl =
      'https://api.openweathermap.org/data/2.5/forecast?units=metric&mode=metric&q=Silverstone&appid=my_very_secret_key';

  late CityWeatherProvider provider;
  late WeatherAPI mockWeatherAPI =
      WeatherAPI('my_very_secret_key', client: client);

  setUp(() {
    provider = CityWeatherProvider(weatherApi: mockWeatherAPI);
  });

  group('CityWeatherProvider Tests', () {
    test('Initial state is empty', () {
      expect(provider.someCityFetching, isFalse);
      expect(provider.someCityFetchError, isFalse);
      expect(provider.getCity('Unknown'), isNull);
    });

    test('Fetch new city weather success', () async {
      const cityName = 'Silverstone';
      const countryName = 'United Kingdom';

      when(client.get(Uri.parse(weatherMockUrl))).thenAnswer(
        (_) async => http.Response(currentWeatherResponseString, 200),
      );

      await provider.fetchNewCityWeather(cityName, countryName);

      final city = provider.getCity(cityName);
      expect(city, isNotNull);
      expect(city?.name, cityName);
      expect(city?.country, countryName);
      expect(city?.currentTemperature?.temperature, 10.93);
      expect(provider.someCityFetching, isFalse);
      expect(provider.someCityFetchError, isFalse);
    });

    test('Fetch new city weather error', () async {
      const cityName = 'Silverstone';
      const countryName = 'United Kingdom';
      const errorMessage =
          'Exception: Failed to fetch weather data for Silverstone: 401';

      when(client.get(Uri.parse(weatherMockUrl))).thenAnswer(
        (_) async =>
            http.Response(currentWeatherResponseNonAuthorizedString, 401),
      );

      await provider.fetchNewCityWeather(cityName, countryName);

      final city = provider.getCity(cityName);
      expect(city, isNotNull);
      expect(city?.fetchError, errorMessage);
      expect(city?.isFetching, isFalse);
      expect(provider.someCityFetching, isFalse);
      expect(provider.someCityFetchError, isTrue);
    });

    test('Do not fetch city weather if already fetching', () async {
      const cityName = 'Silverstone';
      const countryName = 'United Kingdom';

      int count = 0;

      when(client.get(Uri.parse(weatherMockUrl))).thenAnswer(
        (_) async {
          count++;
          return Future.delayed(
            const Duration(milliseconds: 100),
            () => http.Response(currentWeatherResponseString, 200),
          );
        },
      );

      provider.fetchNewCityWeather(cityName, countryName);
      expect(count, equals(1));

      provider.fetchNewCityWeather(cityName, countryName);
      expect(count, equals(1));
    });
  });

  setUp(() {
    provider = CityWeatherProvider(weatherApi: mockWeatherAPI);
  });

  group('CityWeatherProvider Forecast Tests', () {
    test('Fetch city forecast weather success', () async {
      const cityName = 'Silverstone';
      const countryName = 'United Kingdom';

      // Mock successful response from forecast endpoint
      when(client.get(Uri.parse(forecastMockUrl))).thenAnswer(
        (_) async => http.Response(forecastWeatherResponseString, 200),
      );

      await provider.fetchCityForecastWeather(cityName, countryName);

      final city = provider.getCity(cityName);
      expect(city, isNotNull);
      expect(city?.name, cityName);
      expect(city?.country, countryName);
      expect(city?.isFetching, isFalse);
    });

    test('Fetch city forecast weather updates existing city', () async {
      const cityName = 'Silverstone';
      const countryName = 'United Kingdom';

      when(client.get(Uri.parse(forecastMockUrl))).thenAnswer(
        (_) async => http.Response(forecastWeatherResponseString, 200),
      );

      await provider.fetchCityForecastWeather(cityName, countryName);

      var city = provider.getCity(cityName);
      expect(city, isNotNull);
      expect(city?.isFetching, isFalse);

      await provider.fetchCityForecastWeather(cityName, countryName);

      city = provider.getCity(cityName);
      expect(city?.forecastTemperatures?.length, greaterThan(0));
    });

    test('Do not fetch forecast if already fetching', () async {
      const cityName = 'Silverstone';
      const countryName = 'United Kingdom';

      int callCount = 0;

      when(client.get(Uri.parse(forecastMockUrl))).thenAnswer(
        (_) async {
          callCount++;
          return Future.delayed(
            const Duration(milliseconds: 100),
            () => http.Response(forecastWeatherResponseString, 200),
          );
        },
      );

      provider.fetchCityForecastWeather(cityName, countryName);
      provider.fetchCityForecastWeather(cityName, countryName);

      await Future.delayed(const Duration(milliseconds: 200));

      expect(callCount, equals(1));
    });
  });
}
