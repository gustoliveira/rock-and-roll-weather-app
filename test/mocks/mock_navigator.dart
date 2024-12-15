import 'package:flutter/widgets.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigatorObserverTest>(onMissingStub: OnMissingStub.returnDefault),
])
class NavigatorObserverTest extends Mock implements NavigatorObserver {}
