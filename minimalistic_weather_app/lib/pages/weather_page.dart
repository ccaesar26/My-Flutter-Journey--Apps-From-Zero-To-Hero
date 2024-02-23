import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:minimalistic_weather_app/services/weather_service.dart';
import 'package:minimalistic_weather_app/models/weather_model.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  // api key
  final _weatherService = WeatherService(apiKey: "e645407cd1d6b3b4c47a608a641096fc");
  Weather? _weather;

  // fetch the weather data
  void _fetchWeather() async {
    // get the current city
    String city = await _weatherService.getCurrentCity();

    // get the weather data
    try {
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // weather animation
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return "assets/sunny.json";
    }
    switch (mainCondition.toLowerCase()) {
      case "clear":
        return "assets/sunny.json";
      case "clouds":
        return "assets/windy.json";
      case "mist":
      case "smoke":
        return "assets/mist.json";
      case "haze":
      case "dust":
      case "fog":
        return "assets/foggy.json";
      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/partly-shower.json";
      case "thunderstorm":
        return "assets/storm.json";
      case "snow":
        return "assets/snow.json";
      default:
        return "assets/sunny.json";
    }
  }

  // init state
  @override
  void initState() {
    super.initState();

    // fetch the weather data on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(
              _weather?.cityName ?? "Loading...",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // animation
            Lottie.asset(
              getWeatherAnimation(_weather?.mainCondition),
            ),
            const SizedBox(
              height: 16,
            ),
            // temperature
            Text(
              "${_weather?.temperature.round() ?? 0} °C",
              style: GoogleFonts.poppins(
                fontSize: 64,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // weather condition
            Text(
              _weather?.mainCondition ?? "Loading...",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
    );
  }
}
