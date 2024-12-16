import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';

class DayTemperature {
  final DateTime day;
  final String? state;
  final String? icon;
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
    this.icon,
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
        icon = map['weather'][0]['icon'],
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

  static Map<DateTime, DayTemperature> forecastFromMap(
    Map<String, dynamic> map,
  ) {
    Map<DateTime, DayTemperature> forecast = {};

    for (Map<String, dynamic> info in map['list']) {
      DateTime day = DateTime.fromMillisecondsSinceEpoch(info['dt'] * 1000);
      day = DateTime(day.year, day.month, day.day);

      if (forecast.containsKey(day) && forecast[day] != null) {
        DayTemperature current = forecast[day]!;

        double newMin = info['main']['temp_min'].toDouble();
        double newMax = info['main']['temp_max'].toDouble();

        current = current.copyWith(
          temperature: info['main']['temp'].toDouble(),
          min: math.min(newMin, current.min ?? newMin),
          max: math.max(newMax, current.max ?? newMax),
        );

        continue;
      }

      forecast[day] = DayTemperature(
        day: day,
        min: info['main']['temp_min'].toDouble(),
        max: info['main']['temp_max'].toDouble(),
      );
    }

    return forecast;
  }

  String todayFormatedDate() {
    return DateFormat("EEEE d MMMM").format(day);
  }

  String forecastWeekday() {
    return DateFormat.E().format(day);
  }

  String forecastDate() {
    return DateFormat.Md().format(day);
  }

  String sunsetHour() {
    if (sunset == null) return '-';
    return DateFormat.Hm().format(sunset!);
  }

  String sunriseHour() {
    if (sunrise == null) return '-';
    return DateFormat.Hm().format(sunrise!);
  }

  DayTemperature copyWith({
    double? temperature,
    double? min,
    double? max,
    double? feelsLike,
  }) {
    return DayTemperature(
      day: day,
      state: state,
      temperature: temperature ?? this.temperature,
      min: min ?? this.min,
      max: max ?? this.max,
      feelsLike: feelsLike ?? this.feelsLike,
      humidity: humidity,
      windSpeed: windSpeed,
      sunrise: sunrise,
      sunset: sunset,
    );
  }

  static IconData getIconFromState(DayTemperature? dayTemperature) {
    switch (dayTemperature?.icon) {
      case '01d' || '01n':
        return FeatherIcons.sun;
      case '02d' || '02n':
      case '03d' || '03n':
        return FeatherIcons.cloud;
      case '04d' || '04n':
        return FeatherIcons.cloudDrizzle;
      case '09d' || '09n':
      case '10d' || '10n':
        return FeatherIcons.cloudRain;
      case '11d' || '11n':
        return FeatherIcons.cloudLightning;
      case '13d' || '13n':
        return Icons.snowing;
      case '50d' || '50n':
        return FeatherIcons.wind;
      default:
        return FeatherIcons.sun;
    }
  }
}
