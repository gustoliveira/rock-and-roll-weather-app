import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/forecast_day_card.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class ForecastTemperaturesList extends StatefulWidget {
  final String cityName;
  final String countryName;

  const ForecastTemperaturesList(this.cityName, this.countryName, {super.key});

  @override
  State<ForecastTemperaturesList> createState() =>
      _ForecastTemperaturesListState();
}

class _ForecastTemperaturesListState extends State<ForecastTemperaturesList> {
  @override
  Widget build(BuildContext context) {
    City? city = context.watch<CityWeatherProvider>().getCity(widget.cityName);

    int count = city?.forecastTemperatures?.length ?? 0;

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: count,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (_, int index) {
        DateTime? day = city?.forecastTemperatures?.keys.elementAt(index);

        DayTemperature? temperature = city?.forecastTemperatures?[day];

        return ForecastDayCard(temperature);
      },
    );
  }
}
