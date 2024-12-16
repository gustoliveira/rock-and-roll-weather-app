import 'package:flutter/widgets.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class MockCityWeatherProvider extends ChangeNotifier
    implements CityWeatherProvider {
  bool _someCityFetching = false;
  bool _someCityFetchError = false;
  String? error = "";

  @override
  bool get someCityFetching => _someCityFetching;

  @override
  bool get someCityFetchError => _someCityFetchError;

  @override
  WeatherAPI get weatherApi =>
      throw UnimplementedError("Mock does not use WeatherAPI.");

  @override
  Future<void> fetchNewCityWeather(String cityName, String countryName) async {
    _someCityFetching = true;
    notifyListeners();
  }

  @override
  Future<void> fetchCityForecastWeather(
    String cityName,
    String countryName,
  ) async {
    _someCityFetching = true;
    notifyListeners();
  }

  @override
  City getCity(String cityName) {
    return City(
      cityName,
      'Mock Country',
      currentTemperature: null,
      isFetching: _someCityFetching,
      fetchError: error,
    );
  }

  void setFetching(bool value) {
    _someCityFetching = value;
    notifyListeners();
  }

  void setFetchError(String? error, bool value) {
    _someCityFetchError = value;
    this.error = error;
    notifyListeners();
  }
}
