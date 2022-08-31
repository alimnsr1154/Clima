import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getweather_data(String city_name) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city_name&appid=$apikey&units=metric';
    Networking net = Networking(url);
    var data = await net.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentlocation();
    Networking net = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.lattitude}&lon=${loc.longitude}&appid=$apikey&units=metric');
    var data = await net.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
