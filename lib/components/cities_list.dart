import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/city_card.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class CitiesList extends StatelessWidget {
  const CitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [
      {
        'provider': Provider.of<CityWeatherProvider>(context, listen: false),
        'cityName': 'Silverstone',
        'coutryName': 'United Kingdom',
      },
      {
        'provider': Provider.of<CityWeatherProvider>(context, listen: false),
        'cityName': 'São Paulo',
        'coutryName': 'Brazil',
      },
      {
        'provider': Provider.of<CityWeatherProvider>(context, listen: false),
        'cityName': 'Melbourne',
        'coutryName': 'Australia',
      },
      {
        'provider': Provider.of<CityWeatherProvider>(context, listen: false),
        'cityName': 'Monte Carlo',
        'coutryName': 'Monaco',
      },
    ];

    return ListView.separated(
      itemCount: providers.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (_, int index) {
        final CityWeatherProvider cityProvider =
            providers[index]['provider'] as CityWeatherProvider;

        return ChangeNotifierProvider.value(
          value: cityProvider,
          child: CityCard(
            "${providers[index]['cityName']}",
            "${providers[index]['coutryName']}",
          ),
        );
      },
    );
  }
}
