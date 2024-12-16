import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';

import '../helpers/test_path.dart';

void main() {
  group('Test DayTemperature model', () {
    test('get fromMap', () async {
      final file = File(testPath('resources/current_weather_response.json'));
      Map<String, dynamic> response = jsonDecode(await file.readAsString());
      DayTemperature dayTemperature = DayTemperature.fromMap(response);

      expect(dayTemperature, isNotNull);
      expect(dayTemperature.day, DateTime(2024, 12, 15, 12, 59, 59, 0));
      expect(dayTemperature.state, "Clouds");
      expect(dayTemperature.temperature, 10.93);
      expect(dayTemperature.min, 10.37);
      expect(dayTemperature.max, 11.9);
      expect(dayTemperature.feelsLike, 10.45);
      expect(dayTemperature.humidity, 91.0);
      expect(dayTemperature.windSpeed, 6.46);
      expect(dayTemperature.sunrise, DateTime(2024, 12, 15, 05, 06, 42, 0));
      expect(dayTemperature.sunset, DateTime(2024, 12, 15, 12, 52, 14, 0));
    });

    test('test forecastFromMap', () async {
      final file = File(testPath('resources/forecast_weather_response.json'));
      Map<String, dynamic> response = jsonDecode(await file.readAsString());
      Map<DateTime, DayTemperature> forecastMap =
          DayTemperature.forecastFromMap(
        response,
      );

      expect(
        forecastMap.keys.toList(),
        equals([
          DateTime(2024, 12, 15),
          DateTime(2024, 12, 16),
          DateTime(2024, 12, 17),
          DateTime(2024, 12, 18),
          DateTime(2024, 12, 19),
          DateTime(2024, 12, 20),
        ]),
      );

      expect(forecastMap[DateTime(2024, 12, 15)]?.day, DateTime(2024, 12, 15));
      expect(forecastMap[DateTime(2024, 12, 15)]?.min, equals(9.34));
      expect(forecastMap[DateTime(2024, 12, 15)]?.max, equals(10.57));
    });

    test('todayFormatedDate', () {
      DayTemperature dayTemperature = DayTemperature(day: DateTime(2022, 1, 1));
      String result = dayTemperature.todayFormatedDate();
      String expected = "Saturday 1 January";
      expect(result, expected);
    });

    test('forecastWeekday', () {
      DayTemperature dayTemperature = DayTemperature(day: DateTime(2022, 1, 1));
      String result = dayTemperature.forecastWeekday();
      String expected = "Sat";
      expect(result, expected);
    });

    test('forecastDate', () {
      DayTemperature dayTemperature = DayTemperature(day: DateTime(2022, 1, 1));
      String result = dayTemperature.forecastDate();
      String expected = "1/1";
      expect(result, expected);
    });
  });

  group('getIconFromState Tests', () {
    test('should return sun icon for 01d or 01n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '01d');
      expect(DayTemperature.getIconFromState(dayTemperature), FeatherIcons.sun);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '01n');
      expect(
          DayTemperature.getIconFromState(nightTemperature), FeatherIcons.sun);
    });

    test('should return cloud icon for 02d, 02n, 03d, or 03n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '02d');
      expect(
          DayTemperature.getIconFromState(dayTemperature), FeatherIcons.cloud);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '02n');
      expect(DayTemperature.getIconFromState(nightTemperature),
          FeatherIcons.cloud);

      final dayTemperature03d =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '03d');
      expect(DayTemperature.getIconFromState(dayTemperature03d),
          FeatherIcons.cloud);

      final nightTemperature03n =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '03n');
      expect(DayTemperature.getIconFromState(nightTemperature03n),
          FeatherIcons.cloud);
    });

    test('should return cloudDrizzle icon for 04d or 04n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '04d');
      expect(DayTemperature.getIconFromState(dayTemperature),
          FeatherIcons.cloudDrizzle);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '04n');
      expect(DayTemperature.getIconFromState(nightTemperature),
          FeatherIcons.cloudDrizzle);
    });

    test('should return cloudRain icon for 09d, 09n, 10d, or 10n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '09d');
      expect(DayTemperature.getIconFromState(dayTemperature),
          FeatherIcons.cloudRain);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '09n');
      expect(DayTemperature.getIconFromState(nightTemperature),
          FeatherIcons.cloudRain);

      final dayTemperature10d =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '10d');
      expect(DayTemperature.getIconFromState(dayTemperature10d),
          FeatherIcons.cloudRain);

      final nightTemperature10n =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '10n');
      expect(DayTemperature.getIconFromState(nightTemperature10n),
          FeatherIcons.cloudRain);
    });

    test('should return cloudLightning icon for 11d or 11n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '11d');
      expect(DayTemperature.getIconFromState(dayTemperature),
          FeatherIcons.cloudLightning);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '11n');
      expect(DayTemperature.getIconFromState(nightTemperature),
          FeatherIcons.cloudLightning);
    });

    test('should return snowing icon for 13d or 13n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '13d');
      expect(DayTemperature.getIconFromState(dayTemperature), Icons.snowing);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '13n');
      expect(DayTemperature.getIconFromState(nightTemperature), Icons.snowing);
    });

    test('should return wind icon for 50d or 50n', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '50d');
      expect(
          DayTemperature.getIconFromState(dayTemperature), FeatherIcons.wind);

      final nightTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: '50n');
      expect(
          DayTemperature.getIconFromState(nightTemperature), FeatherIcons.wind);
    });

    test('should return sun icon for default case', () {
      final dayTemperature =
          DayTemperature(day: DateTime(2022, 1, 1), icon: 'unknown');
      expect(DayTemperature.getIconFromState(dayTemperature), FeatherIcons.sun);
    });
  });

  group('DayTemperature.copyWith Tests', () {
    test('should return a new instance with updated temperature', () {
      final original = DayTemperature(
        day: DateTime(2024, 12, 15),
        state: 'Clear',
        temperature: 25.0,
        min: 20.0,
        max: 30.0,
        feelsLike: 27.0,
        humidity: 60,
        windSpeed: 5.0,
        sunrise: DateTime(2024, 12, 15, 6, 0),
        sunset: DateTime(2024, 12, 15, 18, 0),
      );

      final updated = original.copyWith(temperature: 28.0);

      expect(updated.temperature, 28.0);
      expect(updated.min, original.min);
      expect(updated.max, original.max);
      expect(updated.feelsLike, original.feelsLike);
      expect(updated.day, original.day);
    });

    test('should return a new instance with updated min and max values', () {
      final original = DayTemperature(
        day: DateTime(2024, 12, 15),
        state: 'Clear',
        temperature: 25.0,
        min: 20.0,
        max: 30.0,
        feelsLike: 27.0,
        humidity: 60,
        windSpeed: 5.0,
        sunrise: DateTime(2024, 12, 15, 6, 0),
        sunset: DateTime(2024, 12, 15, 18, 0),
      );

      final updated = original.copyWith(min: 18.0, max: 32.0);

      expect(updated.min, 18.0);
      expect(updated.max, 32.0);
      expect(updated.temperature, original.temperature);
      expect(updated.feelsLike, original.feelsLike);
      expect(updated.day, original.day);
    });

    test('should return a new instance with updated feelsLike', () {
      final original = DayTemperature(
        day: DateTime(2024, 12, 15),
        state: 'Clear',
        temperature: 25.0,
        min: 20.0,
        max: 30.0,
        feelsLike: 27.0,
        humidity: 60,
        windSpeed: 5.0,
        sunrise: DateTime(2024, 12, 15, 6, 0),
        sunset: DateTime(2024, 12, 15, 18, 0),
      );

      final updated = original.copyWith(feelsLike: 29.0);

      expect(updated.feelsLike, 29.0);
      expect(updated.temperature, original.temperature);
      expect(updated.min, original.min);
      expect(updated.max, original.max);
      expect(updated.day, original.day);
    });

    test('should return the same instance if no fields are updated', () {
      final original = DayTemperature(
        day: DateTime(2024, 12, 15),
        state: 'Clear',
        temperature: 25.0,
        min: 20.0,
        max: 30.0,
        feelsLike: 27.0,
        humidity: 60,
        windSpeed: 5.0,
        sunrise: DateTime(2024, 12, 15, 6, 0),
        sunset: DateTime(2024, 12, 15, 18, 0),
      );

      final updated = original.copyWith();

      expect(updated.temperature, original.temperature);
      expect(updated.min, original.min);
      expect(updated.max, original.max);
      expect(updated.feelsLike, original.feelsLike);
      expect(updated.day, original.day);
    });

    test('should handle multiple field updates', () {
      final original = DayTemperature(
        day: DateTime(2024, 12, 15),
        state: 'Clear',
        temperature: 25.0,
        min: 20.0,
        max: 30.0,
        feelsLike: 27.0,
        humidity: 60,
        windSpeed: 5.0,
        sunrise: DateTime(2024, 12, 15, 6, 0),
        sunset: DateTime(2024, 12, 15, 18, 0),
      );

      final updated = original.copyWith(
        temperature: 28.0,
        min: 22.0,
        max: 35.0,
        feelsLike: 30.0,
      );

      expect(updated.temperature, 28.0);
      expect(updated.min, 22.0);
      expect(updated.max, 35.0);
      expect(updated.feelsLike, 30.0);
      expect(updated.day, original.day);
    });
  });

  group('DayTemperature Time Formatting Tests', () {
    test('sunsetHour should return formatted hour when sunset is valid', () {
      final dayTemperature = DayTemperature(
        day: DateTime(2024, 12, 15),
        sunset: DateTime(2024, 12, 15, 18, 30), // 18:30
        sunrise: null,
      );

      expect(dayTemperature.sunsetHour(),
          DateFormat.Hm().format(DateTime(2024, 12, 15, 18, 30)));
    });

    test('sunsetHour should return "-" when sunset is null', () {
      final dayTemperature = DayTemperature(
        day: DateTime(2024, 12, 15),
        sunset: null,
        sunrise: null,
      );

      expect(dayTemperature.sunsetHour(), '-');
    });

    test('sunriseHour should return formatted hour when sunrise is valid', () {
      final dayTemperature = DayTemperature(
        day: DateTime(2024, 12, 15),
        sunset: null,
        sunrise: DateTime(2024, 12, 15, 6, 15), // 06:15
      );

      expect(dayTemperature.sunriseHour(),
          DateFormat.Hm().format(DateTime(2024, 12, 15, 6, 15)));
    });

    test('sunriseHour should return "-" when sunrise is null', () {
      final dayTemperature = DayTemperature(
        day: DateTime(2024, 12, 15),
        sunset: null,
        sunrise: null,
      );

      expect(dayTemperature.sunriseHour(), '-');
    });

    test('both sunriseHour and sunsetHour should return valid formatted times',
        () {
      final dayTemperature = DayTemperature(
        day: DateTime(2024, 12, 15),
        sunset: DateTime(2024, 12, 15, 19, 0), // 19:00
        sunrise: DateTime(2024, 12, 15, 5, 45), // 05:45
      );

      expect(dayTemperature.sunsetHour(),
          DateFormat.Hm().format(DateTime(2024, 12, 15, 19, 0)));
      expect(dayTemperature.sunriseHour(),
          DateFormat.Hm().format(DateTime(2024, 12, 15, 5, 45)));
    });
  });
}
