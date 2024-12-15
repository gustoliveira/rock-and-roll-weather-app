import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionProvider extends ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  InternetConnectionProvider([InternetConnection? internetConnection]) {
    (internetConnection ?? InternetConnection())
        .onStatusChange
        .listen((InternetStatus status) {
      _isConnected = status == InternetStatus.connected;
      notifyListeners();
    });
  }
}
