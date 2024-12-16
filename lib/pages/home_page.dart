import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/cities_list.dart';
import 'package:rock_and_roll_weather_app/components/custom_app_bar.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchCitiesTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(statusIcon: status()),
      body: CitiesList(),
    );
  }

  Widget? status() {
    if (context.watch<CityWeatherProvider>().someCityFetching) {
      return CircularProgressIndicator(color: Colors.black);
    }

    if (context.watch<CityWeatherProvider>().someCityFetchError) {
      return Icon(Icons.error);
    }

    return null;
  }
}
