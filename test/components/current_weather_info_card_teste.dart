import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';
import 'package:rock_and_roll_weather_app/components/current_weather_info_card.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

import '../mocks/mock_http_client.mocks.dart';
import '../resources/current_weather_response_string.dart';

void main() {
  final MockClient client = MockClient();

  final String mockUrl =
      'https://api.openweathermap.org/data/2.5/weather?units=metric&mode=metric&q=Silverstone&appid=my_very_secret_key';

  CityWeatherProvider? provider = CityWeatherProvider(
    weatherApi: WeatherAPI('my_very_secret_key', client: client),
  );

  Future<void> createWidget(
    WidgetTester tester, {
    VoidCallback? onTap,
  }) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<CityWeatherProvider>(
        create: (_) => provider,
        child: MaterialApp(
          home: Scaffold(
            body: CurrentWeatherInfoCard("Silverstone"),
          ),
        ),
      ),
    );

    await tester.pump();
  }

  group('CurrentWeatherInfoCard Widget test', () {
    testWidgets('check elements', (WidgetTester tester) async {
      when(client.get(Uri.parse(mockUrl))).thenAnswer(
        (_) async {
          return http.Response(currentWeatherResponseString, 200);
        },
      );

      await createWidget(tester);

      expect(find.text('-°C'), findsNWidgets(3));
    });
  });
}
