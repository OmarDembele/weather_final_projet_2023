

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_final_projet_2023/screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}