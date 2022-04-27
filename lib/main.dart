import 'package:clima/screens/loadingScreen.dart';
import 'package:clima/screens/locationScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Clima());

class Clima extends StatelessWidget {
  const Clima({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      theme: ThemeData.dark(),
      home:  const LoadingScreen(),
    );
  }
}
