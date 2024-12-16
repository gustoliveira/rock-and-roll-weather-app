import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class CityPageHeader extends StatelessWidget {
  final String cityName;

  const CityPageHeader(this.cityName, {super.key});

  @override
  Widget build(BuildContext context) {
    City? city = context.watch<CityWeatherProvider>().getCity(cityName);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cityInfo(city),
          weatherStateIcon(city),
        ],
      ),
    );
  }

  Widget cityInfo(City? city) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${city?.name}",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${city?.currentTemperature?.todayFormatedDate()}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget weatherStateIcon(City? city) {
    return Icon(
      DayTemperature.getIconFromState(city?.currentTemperature),
      size: 45,
      color: Colors.black,
    );
  }
}
