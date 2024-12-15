import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/custom_app_bar.dart';
import 'package:rock_and_roll_weather_app/components/no_internet_banner.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

import '../mocks/mock_navigator.mocks.dart';
import '../mocks/providers/internet_connection_provider_mock.dart';

void main() {
  final MockNavigatorObserverTest mockObserver = MockNavigatorObserverTest();

  Future<void> createWidget(
    WidgetTester tester, {
    InternetConnectionProvider? provider,
    bool showReturnButton = false,
    Widget? statusIcon,
  }) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<InternetConnectionProvider>(
        create: (_) => provider ?? MockInternetConnectionProvider(),
        child: MaterialApp(
          navigatorObservers: [mockObserver],
          home: Scaffold(
            appBar: CustomAppBar(
              showReturnButton: showReturnButton,
              statusIcon: statusIcon,
            ),
          ),
        ),
      ),
    );

    await tester.pump();
  }

  group('CustomAppBar widget test', () {
    testWidgets('check components', (WidgetTester tester) async {
      await createWidget(
        tester,
        provider: MockInternetConnectionProvider(),
      );

      expect(find.text("Rock n' Weather"), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });

    testWidgets(
      'check components return button and loading',
      (WidgetTester tester) async {
        await createWidget(
          tester,
          provider: MockInternetConnectionProvider(),
          showReturnButton: true,
          statusIcon: const CircularProgressIndicator(),
        );

        expect(find.text("Rock n' Weather"), findsOneWidget);
        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'check go back by tapping the return button',
      (WidgetTester tester) async {
        await createWidget(
          tester,
          provider: MockInternetConnectionProvider(),
          showReturnButton: true,
          statusIcon: const CircularProgressIndicator(),
        );

        expect(find.byIcon(Icons.arrow_back), findsOneWidget);
        await tester.tap(find.byIcon(Icons.arrow_back));

        await tester.pumpAndSettle();

        verify(mockObserver.didPop(any, any));
      },
    );

    testWidgets(
      'shows the banner when there is no internet connection (isConnected = false)',
      (WidgetTester tester) async {
        await createWidget(
          tester,
          provider: MockNoInternetConnectionProvider(),
        );

        expect(find.byType(NoInternetBanner), findsOneWidget);
        expect(find.text('No internet =('), findsOneWidget);
      },
    );

    testWidgets(
      'hides the banner when there is internet connection (isConnected = true)',
      (WidgetTester tester) async {
        await createWidget(
          tester,
          provider: MockInternetConnectionProvider(),
        );

        expect(find.byType(NoInternetBanner), findsOneWidget);
        expect(find.text('No internet =('), findsNothing);
      },
    );
  });
}
