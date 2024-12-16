import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rock_and_roll_weather_app/components/cities_list.dart';
import 'package:rock_and_roll_weather_app/components/city_card.dart';
import 'package:rock_and_roll_weather_app/components/city_page_header.dart';
import 'package:rock_and_roll_weather_app/components/current_weather_info_card.dart';
import 'package:rock_and_roll_weather_app/components/custom_app_bar.dart';
import 'package:rock_and_roll_weather_app/components/forecast_temperatures_list.dart';
import 'package:rock_and_roll_weather_app/pages/city_page.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

import '../mocks/providers/city_weather_provider.dart_mock.dart';
import '../mocks/providers/internet_connection_provider_mock.dart';

void main() {
  Future<void> createWidget(
    WidgetTester tester, {
    List<SingleChildWidget>? mockedProviders,
  }) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: mockedProviders ??
            [
              ChangeNotifierProvider<InternetConnectionProvider>.value(
                value: MockInternetConnectionProvider(),
              ),
              ChangeNotifierProvider<CityWeatherProvider>.value(
                value: MockCityWeatherProvider(),
              ),
            ],
        child: MaterialApp(
          home: CityPage(
            cityName: 'Silverstone',
            countryName: 'United Kingdom',
          ),
        ),
      ),
    );
  }

  group('HomePage Tests', () {
    testWidgets('check elements when there is internet', (tester) async {
      await createWidget(tester);

      expect(find.text("Rock n' Weather"), findsOneWidget);
      expect(find.text("Silverstone"), findsOneWidget);
      expect(find.text("No internet =("), findsNothing);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(Icons.error), findsNothing);

      expect(find.byType(CityPageHeader), findsOneWidget);
      expect(find.byType(CurrentWeatherInfoCard), findsOneWidget);
      expect(find.text("Forecast Days"), findsOneWidget);
      expect(find.byType(ForecastTemperaturesList), findsOneWidget);
    });

    testWidgets('shows no internet banner', (tester) async {
      await createWidget(tester, mockedProviders: [
        ChangeNotifierProvider<InternetConnectionProvider>.value(
          value: MockNoInternetConnectionProvider(),
        ),
        ChangeNotifierProvider<CityWeatherProvider>.value(
          value: MockCityWeatherProvider(),
        ),
      ]);

      expect(find.text("No internet =("), findsOneWidget);
    });

    testWidgets('shows no internet banner', (tester) async {
      await createWidget(tester, mockedProviders: [
        ChangeNotifierProvider<InternetConnectionProvider>.value(
          value: MockNoInternetConnectionProvider(),
        ),
        ChangeNotifierProvider<CityWeatherProvider>.value(
          value: MockCityWeatherProvider(),
        ),
      ]);

      expect(find.text("No internet =("), findsOneWidget);
    });
  });
}
