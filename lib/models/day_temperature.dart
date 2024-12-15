import 'package:intl/intl.dart';

class DayTemperature {
  final DateTime day;
  final String? state;
  final double? temperature;
  final double? min;
  final double? max;
  final double? feelsLike;
  final double? humidity;
  final double? windSpeed;
  final DateTime? sunrise;
  final DateTime? sunset;

  const DayTemperature({
    required this.day,
    this.state,
    this.temperature,
    this.min,
    this.max,
    this.feelsLike,
    this.humidity,
    this.windSpeed,
    this.sunrise,
    this.sunset,
  });

  DayTemperature.fromMap(Map<String, dynamic> map)
      : day = DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000),
        state = map['weather'][0]['main'],
        temperature = map['main']['temp'].toDouble(),
        min = map['main']['temp_min'].toDouble(),
        max = map['main']['temp_max'].toDouble(),
        feelsLike = map['main']['feels_like'].toDouble(),
        humidity = map['main']['humidity'].toDouble(),
        windSpeed = map['wind']['speed'].toDouble(),
        sunrise =
            DateTime.fromMillisecondsSinceEpoch(map['sys']['sunrise'] * 1000),
        sunset =
            DateTime.fromMillisecondsSinceEpoch(map['sys']['sunset'] * 1000);

  String todayFormatedDate() {
    return DateFormat("EEEE d MMMM").format(day);
  }

  String forecastWeekday() {
    return DateFormat.E().format(day);
  }

  String forecastDate() {
    return DateFormat.Md().format(day);
  }
}
