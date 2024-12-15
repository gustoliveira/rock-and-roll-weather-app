import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';
import 'package:rock_and_roll_weather_app/components/city_card.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

import '../mocks/mock_http_client.mocks.dart';
import '../resources/current_weather_response_non_authorized_string.dart';
import '../resources/current_weather_response_string.dart';

void main() {
  final MockClient client = MockClient();

  final String mockUrl =
      'https://api.openweathermap.org/data/2.5/weather?units=metric&mode=metric&q=Silverstone&appid=my_very_secret_key';

  Future<void> createWidget(
    WidgetTester tester, {
    VoidCallback? onTap,
  }) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<CityWeatherProvider>(
        create: (_) => CityWeatherProvider(
          weatherApi: WeatherAPI('my_very_secret_key', client: client),
        ),
        child: MaterialApp(
          home: Scaffold(
            body: CityCard("Silverstone", "United Kingdom", onTap: onTap),
          ),
        ),
      ),
    );

    await tester.pump();
  }

  group('CityCard test', () {
    testWidgets('success message', (WidgetTester tester) async {
      when(client.get(Uri.parse(mockUrl))).thenAnswer(
        (_) async => http.Response(currentWeatherResponseString, 200),
      );

      await createWidget(tester);
      await tester.pump();

      expect(find.byType(ImageFiltered), findsOneWidget);
      expect(find.byType(CityCard), findsOneWidget);
      expect(find.text('Silverstone'), findsOneWidget);
      expect(find.text('United Kingdom'), findsOneWidget);
      expect(find.text('10.93°C'), findsOneWidget);

      ImageFiltered imageFiltered =
          find.byType(ImageFiltered).evaluate().first.widget as ImageFiltered;

      expect(imageFiltered.enabled, isFalse);
    });

    testWidgets('while loading', (WidgetTester tester) async {
      when(client.get(Uri.parse(mockUrl))).thenAnswer(
        (_) async => Future.delayed(
          const Duration(milliseconds: 100),
          () => http.Response(currentWeatherResponseString, 200),
        ),
      );

      await createWidget(tester);
      await tester.pump();

      expect(find.byType(ImageFiltered), findsOneWidget);
      expect(find.byType(CityCard), findsOneWidget);
      expect(find.text('Silverstone'), findsOneWidget);
      expect(find.text('United Kingdom'), findsOneWidget);
      expect(find.text('-°C'), findsOneWidget);

      ImageFiltered imageFiltered =
          find.byType(ImageFiltered).evaluate().first.widget as ImageFiltered;

      expect(imageFiltered.enabled, isTrue);
      await tester.pumpAndSettle();
    });

    testWidgets('error message', (WidgetTester tester) async {
      when(client.get(Uri.parse(mockUrl))).thenAnswer((_) async =>
          http.Response(currentWeatherResponseNonAuthorizedString, 401));

      await createWidget(tester);
      await tester.pump();

      expect(find.byType(ImageFiltered), findsOneWidget);
      expect(find.byType(CityCard), findsOneWidget);
      expect(find.text('Silverstone'), findsOneWidget);
      expect(find.text('United Kingdom'), findsOneWidget);
      expect(find.text('-°C'), findsOneWidget);

      ImageFiltered imageFiltered =
          find.byType(ImageFiltered).evaluate().first.widget as ImageFiltered;

      expect(imageFiltered.enabled, isFalse);
    });

    testWidgets('on tap', (WidgetTester tester) async {
      when(client.get(Uri.parse(mockUrl))).thenAnswer(
        (_) async => http.Response(currentWeatherResponseString, 200),
      );

      int flag = 0;

      await createWidget(tester, onTap: () => flag = 1);
      await tester.pump();

      await tester.tap(find.text('Silverstone'));
      await tester.pump();

      expect(flag, 1);
    });
  });
}
