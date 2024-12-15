import 'package:mockito/mockito.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

class MockNoInternetConnectionProvider extends Mock
    implements InternetConnectionProvider {
  @override
  bool get isConnected => false;
}

class MockInternetConnectionProvider extends Mock
    implements InternetConnectionProvider {
  @override
  bool get isConnected => true;
}
