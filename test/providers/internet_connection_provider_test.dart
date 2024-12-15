import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

import '../mocks/mock_internet_connectivity.mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('InternetConnectionProvider', () {
    test('should update isConnected when connection status changes', () async {
      final mockInternetConnection = MockInternetConnectivityTest();

      final statusController = StreamController<InternetStatus>();

      when(mockInternetConnection.onStatusChange).thenAnswer(
        (_) => statusController.stream,
      );

      final provider = InternetConnectionProvider(mockInternetConnection);

      expect(provider.isConnected, true);

      statusController.add(InternetStatus.disconnected);
      await Future.delayed(Duration.zero);
      expect(provider.isConnected, false);

      statusController.add(InternetStatus.connected);
      await Future.delayed(Duration.zero);
      expect(provider.isConnected, true);

      await statusController.close();
    });

    test('should update isConnected when connection status changes', () async {
      final mockInternetConnection = MockInternetConnectivityTest();

      final statusController = StreamController<InternetStatus>();

      when(mockInternetConnection.onStatusChange).thenAnswer(
        (_) => statusController.stream,
      );

      final provider = InternetConnectionProvider();
      expect(provider.isConnected, true);
    });
  });
}
