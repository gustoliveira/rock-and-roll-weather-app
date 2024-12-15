import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([], customMocks: [
  MockSpec<InternetConnectivityTest>(
      onMissingStub: OnMissingStub.returnDefault),
])
class InternetConnectivityTest extends Mock implements InternetConnection {}
