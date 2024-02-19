import 'package:flutter/material.dart';
import 'package:projects/Activity_for_WeatherApp/home.dart';
import 'package:projects/Activity_for_WeatherApp/loading.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loading(),

    routes: {
              //for going to appropriate page
      // "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading" : (context) => Loading(),
    },

  ));
}