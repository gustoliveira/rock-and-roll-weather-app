import 'package:flutter/material.dart';
import 'package:rock_and_roll_weather_app/models/day_temperature.dart';

class ForecastDayCard extends StatefulWidget {
  final DayTemperature? dayTemperature;

  const ForecastDayCard(this.dayTemperature, {super.key});

  @override
  State<ForecastDayCard> createState() => _ForecastDayCardState();
}

class _ForecastDayCardState extends State<ForecastDayCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          day(),
          temperatureColumn(
            widget.dayTemperature?.min.toString() ?? '-',
            'Min',
          ),
          temperatureColumn(
            widget.dayTemperature?.max.toString() ?? '-',
            'Max',
          ),
        ],
      ),
    );
  }

  Widget day() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.dayTemperature?.forecastWeekday().toString() ?? '-',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.dayTemperature?.forecastDate().toString() ?? '-',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget temperatureColumn(String temperature, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$temperature°C",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
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
}
