import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projects/Worker/worker.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "indore";
  late String temp;
  late String humidity;
  late String airSpeed;
  late String description;
  late String main;
  late String icon;

  @override
  void initState() {
    super.initState();
    startApp(city);
  }

  void startApp(String city) async {
    try {
      worker instance = worker(city);
      await instance.getData();

      setState(() {
        temp = instance.temp;
        humidity = instance.humidity;
        airSpeed = instance.airSpeed;
        description = instance.description;
        main = instance.main;
        icon = instance.icon;
      });

      // Delay navigation to simulate loading time
      await Future.delayed(Duration(seconds: 2));

      Navigator.of(context).pushReplacementNamed(
        "/home",
        arguments: {
          "temp_value": temp,
          "hum_value": humidity,
          "airSpeed_value": airSpeed,
          "des_value": description,
          "main_value": main,
          "icon_value": icon,
          "city_value": city,
        },
      );
    } catch (error) {
      // Handle error if any occurs during data fetching
      print("Error fetching data: $error");
      // Optionally show a Snackbar or display an error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    Map<String, dynamic> search = arguments as Map<String, dynamic>? ?? {};

    city = search['searchText'] ?? city;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              Image.asset(
                "images/WeatherAppLogo.png",
                height: 240,
                width: 240,
              ),
              Text(
                "Weather APP",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.yellowAccent,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Made by Aj",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
              SizedBox(height: 40,),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}
