import 'package:rock_and_roll_weather_app/models/day_temperature.dart';

class City {
  final String name;
  final String country;
  final String? countryCode;
  final DayTemperature? currentTemperature;
  final Map<DateTime, DayTemperature>? forecastTemperatures;
  final bool? isFetching;
  final String? fetchError;

  const City(
    this.name,
    this.country, {
    this.countryCode,
    this.currentTemperature,
    this.forecastTemperatures,
    this.isFetching,
    this.fetchError,
  });

  City.fromMap(Map<String, dynamic> map, String cityName, String countryName)
      : name = cityName,
        country = countryName,
        countryCode = map['sys']['country'],
        currentTemperature = DayTemperature.fromMap(map),
        forecastTemperatures = {},
        isFetching = false,
        fetchError = null;

  City copyWith({
    String? name,
    String? country,
    DayTemperature? currentTemperature,
    bool? isFetching,
    String? fetchError,
    Map<DateTime, DayTemperature>? forecastTemperatures,
  }) {
    return City(
      name ?? this.name,
      country ?? this.country,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      isFetching: isFetching ?? this.isFetching,
      fetchError: fetchError ?? this.fetchError,
      forecastTemperatures: forecastTemperatures ?? this.forecastTemperatures,
      countryCode: countryCode,
    );
  }
}
