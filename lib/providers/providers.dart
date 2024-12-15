import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rock_and_roll_weather_app/api/weather_api.dart';
import 'package:rock_and_roll_weather_app/providers/city_weather_provider.dart';
import 'package:rock_and_roll_weather_app/providers/internet_connection_provider.dart';

const String openWeatherKey = String.fromEnvironment(
  'OPEN_WEATHER_KEY',
  defaultValue: '',
);

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => InternetConnectionProvider()),
  ChangeNotifierProvider(
    create: (_) => CityWeatherProvider(
      weatherApi: WeatherAPI(openWeatherKey),
    ),
  ),
];
