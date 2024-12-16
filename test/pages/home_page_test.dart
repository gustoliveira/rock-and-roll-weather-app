import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rock_and_roll_weather_app/components/cities_list.dart';
import 'package:rock_and_roll_weather_app/components/city_card.dart';
import 'package:rock_and_roll_weather_app/components/custom_app_bar.dart';
import 'package:rock_and_roll_weather_app/pages/city_page.dart';
import 'package:rock_and_roll_weather_app/pages/home_page.dart';
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
          home: HomePage(title: "Rock n' Tests"),
        ),
      ),
    );
  }

  group('HomePage Tests', () {
    testWidgets('check elements when there is internet', (tester) async {
      await createWidget(tester);

      expect(find.text("Rock n' Weather"), findsOneWidget);
      expect(find.text("No internet =("), findsNothing);

      expect(find.byType(TextField), findsOneWidget);

      expect(find.byType(CustomAppBar), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(Icons.error), findsNothing);

      expect(find.byType(CitiesList), findsOneWidget);
      expect(find.byType(CityCard), findsNWidgets(4));
      expect(find.text("Silverstone"), findsOneWidget);
      expect(find.text("São Paulo"), findsOneWidget);
      expect(find.text("Melbourne"), findsOneWidget);
      expect(find.text("Monaco"), findsOneWidget);
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

    testWidgets('check text field', (tester) async {
      await createWidget(tester);
      expect(find.byType(TextField), findsOneWidget);

      expect(find.text("Search cities..."), findsOneWidget);

      const testInput = 'São P';
      await tester.enterText(find.byType(TextField), testInput);

      final textFieldWidget = tester.widget<TextField>(find.byType(TextField));
      expect(textFieldWidget.controller?.text, equals(testInput));
    });

    testWidgets('check during loading of cities', (tester) async {
      MockCityWeatherProvider mockWeather = MockCityWeatherProvider();

      mockWeather.setFetching(true);

      await createWidget(tester, mockedProviders: [
        ChangeNotifierProvider<InternetConnectionProvider>.value(
          value: MockInternetConnectionProvider(),
        ),
        ChangeNotifierProvider<CityWeatherProvider>.value(
          value: mockWeather,
        ),
      ]);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byIcon(Icons.error), findsNothing);
    });

    testWidgets('check when theres error during the fetch', (tester) async {
      MockCityWeatherProvider mockWeather = MockCityWeatherProvider();

      mockWeather.setFetching(false);
      mockWeather.setFetchError("Error message", true);

      await createWidget(tester, mockedProviders: [
        ChangeNotifierProvider<InternetConnectionProvider>.value(
          value: MockInternetConnectionProvider(),
        ),
        ChangeNotifierProvider<CityWeatherProvider>.value(
          value: mockWeather,
        ),
      ]);

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('open the CityPage when tap in the card', (tester) async {
      await createWidget(tester);

      expect(find.text('Silverstone'), findsOneWidget);
      await tester.tap(find.text('Silverstone'));

      await tester.idle();
      await tester.pumpAndSettle();

      expect(find.byType(CityPage), findsOneWidget);
    });
  });

  group('check filter cities', () {
    testWidgets('open the CityPage when tap in the card', (tester) async {
      await createWidget(tester);

      expect(find.byType(CitiesList), findsOneWidget);
      expect(find.byType(CityCard), findsNWidgets(4));
      expect(find.text("Silverstone"), findsOneWidget);
      expect(find.text("São Paulo"), findsOneWidget);
      expect(find.text("Melbourne"), findsOneWidget);
      expect(find.text("Monaco"), findsOneWidget);

      const testInput = 'Monaco';
      await tester.enterText(find.byType(TextField), testInput);

      await tester.idle();
      await tester.pump();

      expect(find.text("Silverstone"), findsNothing);
      expect(find.text("São Paulo"), findsNothing);
      expect(find.text("Melbourne"), findsNothing);
      expect(find.text("Monaco"), findsOneWidget);
    });
  });
}
