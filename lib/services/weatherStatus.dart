import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'a51b530d5bd014c28255f7ccefa00de3';


class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    ClimaNetwork net = ClimaNetwork(
      '$openWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric',
    );
    var weatherData = await net.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    ClimaNetwork net = ClimaNetwork(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await net.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 25) {
      return 'Time for shorts and ๐';
    } else if (temp < 15) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
