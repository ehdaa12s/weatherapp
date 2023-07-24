import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Provider/Wether_provider.dart';
import 'package:weatherapp/models/Weather_model.dart';
import 'package:weatherapp/pages/search%20page.dart';
import 'package:weatherapp/services/user_Services.dart';

class Home_Screen extends StatefulWidget {
   Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
WeatherModel ? WeatherDATA;




  @override
  Widget build(BuildContext context) {
    WeatherDATA=Provider.of<WeatherProvider>(context, listen: true).WeatherDATA;

    return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(
                 builder: (context) => Search_Page(
                 )),

             );
            },
            icon: const Icon(Icons.search
            ,
              size: 40,),
          ),
        ],
        title: Text('Weather App',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[200],

      ),
      body:   WeatherDATA == null ?
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ):Container(decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.orange,
             WeatherDATA!.getThemeColor() as Color,
            ],
          )
      ),
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
           children:[
              Spacer(
                flex: 2,
              ),
             Text(Provider.of<WeatherProvider>(context).cityName!,
             style: TextStyle(
               fontSize: 30,
               fontWeight: FontWeight.bold,
             ),
             ),
             Text("update at ${WeatherDATA!.date.toString()})",

               style: TextStyle(
                 fontSize: 15,
                 fontWeight: FontWeight.bold,
               ),

             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Image.asset(WeatherDATA!.getImage(),


                    ),


                   Text("${WeatherDATA!.temp.toInt().toString()}°C ",
                     style: TextStyle(
                       fontSize: 50,
                       fontWeight: FontWeight.bold,
                     ),
                   ),

                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Column(
                        children: [
                          Text("maxTemp: ${WeatherDATA!.maxTemp.toInt()}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("minTemp: ${WeatherDATA!.minTemp.toInt()}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                     ),
                   )
                 ],

               ),
             ),
              Text(WeatherDATA!.WheatherStateName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
             Spacer(
                flex: 5,
              ),

           ],
         ),
       ),
      ),

    );
  }
}
