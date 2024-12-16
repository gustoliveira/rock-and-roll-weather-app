import 'package:flutter/material.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';

class CityWeatherProvider with ChangeNotifier {
  final Map<String, City> _cities = {};
  final WeatherAPI weatherApi;

  static const String openWeatherKey = String.fromEnvironment(
    'OPEN_WEATHER_KEY',
    defaultValue: '',
  );

  CityWeatherProvider({
    this.weatherApi = const WeatherAPI(openWeatherKey),
  });

  bool get someCityFetching =>
      _cities.values.any((city) => city.isFetching == true);

  bool get someCityFetchError =>
      _cities.values.any((city) => city.fetchError != null);

  City? getCity(String cityName) {
    return _cities[cityName];
  }

  Future<void> fetchNewCityWeather(String cityName, String countryName) async {
    City? city = _cities[cityName];
    if (city != null && city.isFetching == true) {
      return;
    }

    _cities[cityName] = city?.copyWith(isFetching: true, fetchError: null) ??
        City(cityName, countryName, isFetching: true);

    notifyListeners();

    Map<String, dynamic> weatherResponse = {};

    try {
      weatherResponse = await weatherApi.fetchWeather(cityName);
      _cities[cityName] = City.fromMap(
        weatherResponse,
        cityName,
        countryName,
      );
    } catch (e) {
      String error = e.toString();
      _cities[cityName] = city?.copyWith(
            isFetching: false,
            fetchError: error,
          ) ??
          City(
            cityName,
            countryName,
            isFetching: false,
            fetchError: error,
          );
    } finally {
      notifyListeners();
    }
  }

  Future<void> fetchCityForecastWeather(
    String cityName,
    String countryName,
  ) async {
    City? city = _cities[cityName];

    if (city != null && city.isFetching == true) {
      return;
    }

    _cities[cityName] = city?.copyWith(isFetching: true, fetchError: null) ??
        City(cityName, countryName, isFetching: true);

    notifyListeners();

    Map<String, dynamic> weatherResponse = {};

    try {
      weatherResponse = await weatherApi.fetchForecastWeather(cityName);

      city = city?.copyWith(
        forecastTemperatures: DayTemperature.forecastFromMap(weatherResponse),
        isFetching: false,
        fetchError: null,
      );

      _cities[cityName] = city!;
    } catch (e) {
      String error = e.toString();

      _cities[cityName] = city?.copyWith(
            isFetching: false,
            fetchError: error,
          ) ??
          City(
            cityName,
            countryName,
            isFetching: false,
            fetchError: error,
          );
    } finally {
      notifyListeners();
    }
  }
}
