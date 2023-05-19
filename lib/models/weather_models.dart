
class Weather{
  String cityName ='';
  String icon = '';
  String description ='';
  double temp = 0.0;
  int humidity = 0;

  Weather({required this.cityName, required this.icon, required this.description, required this.temp, required this.humidity,});

  //  Now let's create a function to parse the JSON file into model
  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"] ?? '';
    icon = json["weather"][0]["icon"] ?? '';
    description =  json['weather'][0]['description'] ?? '';
    temp = json["main"]["temp"] ?? 0.0;
    humidity = json["main"]["humidity"] ?? 0;

  }
}
