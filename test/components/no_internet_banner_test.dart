import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/no_internet_banner.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

import '../mocks/providers/internet_connection_provider_mock.dart';

void main() {
  Future<void> createWidget(
    WidgetTester tester,
    InternetConnectionProvider provider,
  ) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<InternetConnectionProvider>(
        create: (_) => provider,
        child: const MaterialApp(
          home: Scaffold(
            body: NoInternetBanner(),
          ),
        ),
      ),
    );

    await tester.pump();
  }

  group('NoInternetBanner Widget', () {
    testWidgets(
      'shows the banner when there is no internet connection (isConnected = false)',
      (WidgetTester tester) async {
        await createWidget(tester, MockNoInternetConnectionProvider());
        expect(find.text('No internet =('), findsOneWidget);
        expect(find.byType(Container), findsOneWidget);
      },
    );

    testWidgets(
      'hides the banner when there is internet connection (isConnected = true)',
      (WidgetTester tester) async {
        await createWidget(tester, MockInternetConnectionProvider());
        expect(find.text('No internet =('), findsNothing);
        expect(find.byType(Container), findsNothing);
      },
    );
  });
}
