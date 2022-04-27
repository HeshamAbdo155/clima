import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'locationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weatherStatus.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLoc();
  }

  void getLoc() async {
    // WeatherModel weather = WeatherModel();
    // await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    var weather = await WeatherModel().getWeatherData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(locationWeather: weather)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitSpinningLines(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
