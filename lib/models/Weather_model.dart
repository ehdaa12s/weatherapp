import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String WheatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.WheatherStateName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    //print(jsonData  );
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      WheatherStateName: jsonData['condition']['text'],
    );
  }
  @override
  String toString() {
    return 'WeatherModel{date: $date, temp: $temp, maxTemp: $maxTemp, minTemp: $minTemp, WheatherStateName: $WheatherStateName}';
  }

  String getImage() {
    if (WheatherStateName == 'Clear' || WheatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (WheatherStateName == 'Sleet' ||
        WheatherStateName == 'Snow' ||
        WheatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (WheatherStateName == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else if (WheatherStateName == 'Heavy Rain') {
      return 'assets/images/rainy.png';
    } else if (WheatherStateName == 'Light Rain') {
      return 'assets/images/rainy.png';
    } else if (WheatherStateName == 'Showers') {
      return 'assets/images/snow.png';
    } else if (WheatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (WheatherStateName == 'Light Cloud') {
      return 'assets/images/cloudy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor? getThemeColor() {
    if (WheatherStateName == 'Clear' || WheatherStateName == 'Light Cloud') {
      return Colors.yellow;
    } else if (WheatherStateName == 'Sleet' ||
        WheatherStateName == 'Snow' ||
        WheatherStateName == 'Hail') {
      return Colors.blue;
    } else if (WheatherStateName == 'Thunderstorm') {
      return Colors.deepPurple;
    } else if (WheatherStateName == 'Heavy Rain') {
      return Colors.indigo;
    } else if (WheatherStateName == 'Light Rain') {
      return Colors.lightBlue;
    } else if (WheatherStateName == 'Showers') {
      return Colors.blueGrey;
      ;
    } else if (WheatherStateName == 'Heavy Cloud') {
      return Colors.grey;
    } else if (WheatherStateName == 'Light Cloud') {
      return Colors.lightBlue;
    } else {
      return Colors.grey;
    }
  }
}
