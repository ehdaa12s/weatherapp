import 'package:flutter/material.dart';
import 'package:weatherapp/models/Weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel ? _WeatherDATA;
  String? cityName;
  set WeatherDATA(WeatherModel? weather){



    _WeatherDATA = weather;
    notifyListeners();
  }
  WeatherModel? get WeatherDATA => _WeatherDATA;
}
