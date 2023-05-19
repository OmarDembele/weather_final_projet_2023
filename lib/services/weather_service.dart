// To start call some http request in flutter we will need the flutter pacage
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_models.dart';

class WeatherAppClient{

  Future<Weather>? getCurrentWeather(String? location) async{
    var endPoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location,&APPID=8e74a88aeee88c5af699ce80943d52c9&units=metric");
    var response = await http.get(endPoint);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      //print(Weather.fromJson(body).cityName);
      return Weather.fromJson(body);
    }
    else{
      throw Exception('Error...');
    }
  }
}