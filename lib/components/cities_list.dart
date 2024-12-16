import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rock_and_roll_weather_app/components/city_card.dart';
import 'package:rock_and_roll_weather_app/pages/city_page.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key});

  @override
  State<CitiesList> createState() => _CitiesListState();
}

class _CitiesListState extends State<CitiesList> {
  final TextEditingController searchCitiesTextController =
      TextEditingController();

  List<Map<String, dynamic>> get allCities => [
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

  List<Map<String, dynamic>> filteredCities = [];

  String searchText = '';

  void filterList(String query) {
    setState(() {
      searchText = query;
      filteredCities = allCities.where((city) {
        return city['cityName'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    filteredCities = allCities;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          textField(),
          Expanded(child: body()),
        ],
      ),
    );
  }

  Widget body() {
    return ListView.separated(
      itemCount: filteredCities.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (_, int index) {
        final CityWeatherProvider cityProvider =
            filteredCities[index]['provider'] as CityWeatherProvider;

        return ChangeNotifierProvider.value(
          value: cityProvider,
          child: CityCard(
            "${filteredCities[index]['cityName']}",
            "${filteredCities[index]['coutryName']}",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return CityPage(
                  cityName: filteredCities[index]['cityName'] as String,
                  countryName: filteredCities[index]['coutryName'] as String,
                );
              }));
            },
          ),
        );
      },
    );
  }

  Widget textField() {
    return TextField(
      controller: searchCitiesTextController,
      onChanged: filterList,
      decoration: InputDecoration(
        hintText: "Search cities...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
