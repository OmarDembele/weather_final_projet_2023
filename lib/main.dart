import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_final_projet_2023/provider/weather_provider.dart';
import 'package:weather_final_projet_2023/runtime/my_app.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

