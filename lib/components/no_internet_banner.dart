import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

class NoInternetBanner extends StatelessWidget {
  const NoInternetBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !context.watch<InternetConnectionProvider>().isConnected,
      child: Container(
        color: Colors.red,
        width: double.infinity,
        child: Center(
          child: Text(
            "No internet =(",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
