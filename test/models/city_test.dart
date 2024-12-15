import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';

import '../helpers/test_path.dart';

void main() {
  group('Test City model', () {
    test('get fromMap', () async {
      final file = File(testPath('resources/current_weather_response.json'));
      Map<String, dynamic> response = jsonDecode(await file.readAsString());
      City city = City.fromMap(response, 'Silverstone', 'United Kingdom');

      expect(city, isNotNull);
      expect(city.name, 'Silverstone');
      expect(city.country, 'United Kingdom');
    });

    test('copyWith', () {
      final city = City(
        'Silverstone',
        'GB',
        currentTemperature: DayTemperature(day: DateTime(2025)),
        isFetching: false,
        fetchError: null,
      );

      final updatedCity = City(
        'London',
        'GB',
        currentTemperature: DayTemperature(day: DateTime(2025)),
        isFetching: true,
        fetchError: 'Error fetching data',
      );

      expect(updatedCity.name, 'London');
      expect(updatedCity.country, 'GB');
      expect(updatedCity.currentTemperature!.day, DateTime(2025));
      expect(updatedCity.currentTemperature!.min, null);
      expect(updatedCity.currentTemperature!.max, null);
      expect(updatedCity.isFetching, true);
      expect(updatedCity.fetchError, 'Error fetching data');

      expect(city.name, 'Silverstone');
      expect(city.currentTemperature!.day, DateTime(2025));
      expect(city.currentTemperature!.min, null);
      expect(city.currentTemperature!.max, null);
      expect(city.isFetching, false);
      expect(city.fetchError, isNull);
    });

    test('copyWith with no parameters should return an identical object', () {
      final city = City(
        'Silverstone',
        'GB',
        currentTemperature: DayTemperature(day: DateTime(2025)),
        isFetching: false,
        fetchError: null,
      );

      final identicalCity = city.copyWith();

      expect(identicalCity.name, city.name);
      expect(identicalCity.country, city.country);
      expect(identicalCity.currentTemperature, city.currentTemperature);
      expect(identicalCity.isFetching, city.isFetching);
      expect(identicalCity.fetchError, city.fetchError);
    });
  });
}
