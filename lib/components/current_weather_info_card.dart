import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class CurrentWeatherInfoCard extends StatelessWidget {
  final String cityName;

  const CurrentWeatherInfoCard(this.cityName, {super.key});

  @override
  Widget build(BuildContext context) {
    City? city = context.watch<CityWeatherProvider>().getCity(cityName);

    return Container(
      decoration: decoration(),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          currentTemperature(city),
          separator(),
          Expanded(child: infos(city)),
        ],
      ),
    );
  }

  Widget currentTemperature(City? city) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          temperature(city),
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${city?.currentTemperature?.state}",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget separator() {
    return Container(
      width: 3,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget infos(City? city) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 18,
        children: [
          infoColumn(
            "${city?.currentTemperature?.min ?? "-"}°C",
            "Min",
            "${city?.currentTemperature?.max ?? "-"}°C",
            "Max",
          ),
          infoColumn(
            "${city?.currentTemperature?.windSpeed?.toString() ?? "-"} Km/h",
            "Wind speed",
            "${city?.currentTemperature?.humidity?.toString() ?? "-"} %",
            "Humidity",
          ),
          infoColumn(
            city?.currentTemperature?.sunriseHour() ?? "-",
            "Sunrise",
            city?.currentTemperature?.sunsetHour() ?? "-",
            "Sunset",
          ),
        ],
      ),
    );
  }

  Widget infoColumn(
    String firstValue,
    String firstLabel,
    String secondValue,
    String secondLabel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          firstValue,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          firstLabel,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        Text(
          secondValue,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(
          secondLabel,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 0.4,
          spreadRadius: 0,
          offset: Offset(1.0, 1.0),
        )
      ],
    );
  }

  String temperature(City? city) {
    if (city == null) {
      return "-°C";
    }

    String? temperature = city.currentTemperature?.temperature?.toString();

    if (temperature == null || city.fetchError != null) {
      temperature = "-";
    }

    return "$temperature°C";
  }
}
