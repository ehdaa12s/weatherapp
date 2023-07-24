import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Provider/Wether_provider.dart';
import 'package:weatherapp/models/Weather_model.dart';
import 'package:weatherapp/pages/Home_Screen.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: ( context) {
        return WeatherProvider();
      },

      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App ',
      theme: ThemeData(

    primarySwatch: Provider.of<WeatherProvider>(context).WeatherDATA == null ? Colors.teal : Provider.of<WeatherProvider>(context).WeatherDATA!.getThemeColor(),

      ),
      home: Home_Screen(),
    );
  }
}


