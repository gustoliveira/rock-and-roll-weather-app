import 'package:rock_and_roll_weather_app/models/day_temperature.dart';

class City {
  final String name;
  final String country;
  final String? countryCode;
  final DayTemperature? currentTemperature;
  final bool? isFetching;
  final String? fetchError;

  const City(
    this.name,
    this.country, {
    this.countryCode,
    this.currentTemperature,
    this.isFetching,
    this.fetchError,
  });

  City.fromMap(Map<String, dynamic> map, String cityName, String countryName)
      : name = cityName,
        country = countryName,
        countryCode = map['sys']['country'],
        currentTemperature = DayTemperature.fromMap(map),
        isFetching = false,
        fetchError = null;

  City copyWith({
    String? name,
    String? country,
    DayTemperature? currentTemperature,
    bool? isFetching,
    String? fetchError,
  }) {
    return City(
      name ?? this.name,
      country ?? this.country,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      isFetching: isFetching ?? this.isFetching,
      fetchError: fetchError ?? this.fetchError,
    );
  }
}
