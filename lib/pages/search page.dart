import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Provider/Wether_provider.dart';
import 'package:weatherapp/models/Weather_model.dart';
import 'package:weatherapp/services/user_Services.dart';

class Search_Page extends StatelessWidget {
  String? cityName;
  Search_Page({this.updateUI});
VoidCallback? updateUI;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search city'),
        backgroundColor: Colors.teal[50],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onSubmitted: (data) async{
                cityName = data;
                WeatherServices services = WeatherServices();
           WeatherModel weather
           =await   services.getWeather(cityName: cityName!);
           Provider.of<WeatherProvider>(context, listen: false).WeatherDATA = weather;
Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;

Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(30),
                fillColor: Colors.black,
                iconColor: Colors.teal[200],
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                label: Text('Search City'),
suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              ),
            ),
          )
        ],
      )),
    );
  }
}


