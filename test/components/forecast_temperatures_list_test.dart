import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/forecast_day_card.dart';
import 'package:rock_and_roll_weather_app/components/forecast_temperatures_list.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class MockCityWeatherProvider extends Mock implements CityWeatherProvider {}

void main() {
  group('ForecastTemperaturesList Tests', () {
    late MockCityWeatherProvider mockProvider;

    setUp(() {
      mockProvider = MockCityWeatherProvider();
    });

    Future<void> createWidget(
      WidgetTester tester, {
      required String cityName,
      required String countryName,
      City? mockCity,
    }) async {
      when(mockProvider.getCity(cityName)).thenReturn(mockCity);

      await tester.pumpWidget(
        ChangeNotifierProvider<CityWeatherProvider>.value(
          value: mockProvider,
          child: MaterialApp(
            home: Scaffold(
              body: ForecastTemperaturesList(cityName, countryName),
            ),
          ),
        ),
      );
    }

    testWidgets(
      'displays list of forecast temperatures when data is available',
      (WidgetTester tester) async {
        final mockCity = City(
          'Silverstone',
          'United Kingdom',
          forecastTemperatures: {
            DateTime(2024, 12, 15): DayTemperature(
              day: DateTime(2024, 12, 15),
              temperature: 15.0,
              state: 'Clear',
              min: 10.0,
              max: 15.0,
            ),
            DateTime(2024, 12, 16): DayTemperature(
              day: DateTime(2024, 12, 16),
              temperature: 10.0,
              state: 'Rain',
              min: 11.0,
              max: 13.0,
            ),
          },
        );

        await createWidget(
          tester,
          cityName: 'Silverstone',
          countryName: 'United Kingdom',
          mockCity: mockCity,
        );

        expect(find.byType(ForecastDayCard), findsNWidgets(2));
        expect(find.text('Max'), findsNWidgets(2));
        expect(find.text('Min'), findsNWidgets(2));

        expect(find.text('15.0°C'), findsOneWidget);
        expect(find.text('10.0°C'), findsOneWidget);
        expect(find.text('11.0°C'), findsOneWidget);
        expect(find.text('13.0°C'), findsOneWidget);
      },
    );

    testWidgets('displays empty list when no forecast data is available',
        (WidgetTester tester) async {
      final mockCity = City(
        'Silverstone',
        'United Kingdom',
        forecastTemperatures: {},
      );

      await createWidget(
        tester,
        cityName: 'Silverstone',
        countryName: 'United Kingdom',
        mockCity: mockCity,
      );

      expect(find.byType(ForecastDayCard), findsNothing);

      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('displays nothing when city is null',
        (WidgetTester tester) async {
      await createWidget(
        tester,
        cityName: 'Silverstone',
        countryName: 'United Kingdom',
        mockCity: null,
      );

      expect(find.byType(ForecastDayCard), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
