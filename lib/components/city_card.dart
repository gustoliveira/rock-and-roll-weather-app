import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/models/city.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class CityCard extends StatefulWidget {
  final String cityName;
  final String coutryName;
  final VoidCallback? onTap;

  const CityCard(
    this.cityName,
    this.coutryName, {
    this.onTap,
    super.key,
  });

  @override
  State<CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<CityCard> {
  late CityWeatherProvider? provider;

  @override
  initState() {
    super.initState();

    provider = Provider.of<CityWeatherProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider?.fetchNewCityWeather(widget.cityName, widget.coutryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      enabled: provider?.getCity(widget.cityName)?.isFetching ?? true,
      imageFilter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: InkWell(
        onTap: () => widget.onTap?.call(),
        child: body(),
      ),
    );
  }

  Widget body() {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: decoration(),
      child: Row(
        children: [
          Expanded(child: cityInfo()),
          temperatureInfo(),
        ],
      ),
    );
  }

  Widget cityInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.cityName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          widget.coutryName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget temperatureInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "${temperature()}°C",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
      ],
    );
  }

  String temperature() {
    City? city = context.watch<CityWeatherProvider>().getCity(widget.cityName);

    if (city == null) {
      return "-";
    }

    String? temperature = city.currentTemperature?.temperature?.toString();

    if (temperature == null || city.fetchError != null) {
      temperature = "-";
    }

    return temperature;
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
}
