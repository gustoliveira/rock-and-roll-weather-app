import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
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
}
