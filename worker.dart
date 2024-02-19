import 'dart:convert';
import 'package:http/http.dart';
import 'dart:html';


class worker{
   late String location;
  
  //constructor
  worker(this.location){
    location = this.location;
  }

   late String temp;
   late String humidity;
   late String airSpeed;
   late String description;
   late String main;
   late String icon;


      //method = info give
      Future<void> getData() async
      {
        try {
          Response response = await get(
              'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=c8616ce27c30067766bbe19ddbaac3b5' as Uri);
          Map data = jsonDecode(response.body);

          print(data);

          //getting temp , humidity
          Map temp_data = data['main'];
          String getHumidity = temp_data['humidity'];
          double getTemp = temp_data['temp'] - 273.15;

          //getting air wind
          Map wind = data['wind'];
          double getAirSpeed = wind['speed'] / 0.27777777777778;

          //getting description
          List weather_data = data['weather'];
          Map weather_main_data = weather_data[0];
          String getMain_des = weather_main_data['description'];
          String getDesc = weather_main_data['description'];

          //assigning values
          temp = getTemp.toString(); //c
          humidity = getHumidity; //%
          airSpeed = getAirSpeed.toString(); //km/hr
          description = getDesc;
          main = getMain_des;
          icon = weather_main_data["icon"].toString();

        }catch(e)
        {
          print(e);
          temp = "NA"; //c
          humidity =  "NA"; //%
          airSpeed =  "NA"; //km/hr
          description =  "Can't Find Data";
          main =  "NA";
          icon = "09d";
        }
    }
}
