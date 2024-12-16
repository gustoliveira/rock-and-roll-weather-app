import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/city_page_header.dart';
import 'package:rock_and_roll_weather_app/components/current_weather_info_card.dart';
import 'package:rock_and_roll_weather_app/components/custom_app_bar.dart';
import 'package:rock_and_roll_weather_app/components/forecast_temperatures_list.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class CityPage extends StatefulWidget {
  final String cityName;
  final String countryName;

  const CityPage({
    required this.cityName,
    required this.countryName,
    super.key,
  });

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  late CityWeatherProvider? provider;
  @override
  void initState() {
    super.initState();

    provider = Provider.of<CityWeatherProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider?.fetchCityForecastWeather(widget.cityName, widget.countryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(showReturnButton: true),
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        CityPageHeader(widget.cityName),
        CurrentWeatherInfoCard(widget.cityName),
        Text(
          'Forecast Days',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: ForecastTemperaturesList(widget.cityName, widget.countryName),
        ),
      ],
    );
  }
}
