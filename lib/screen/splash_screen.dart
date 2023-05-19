import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_final_projet_2023/screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const OnBoardingScreen();
            },
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 300,
                width: 60,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.only(top: 60, ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: "Weather App",
                              style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              )
                          )
                      ),
                    ],
                  ),
                ),
              )
          ),
          Positioned(
            top: 220,
            right: 25,
            left: 25,
            child: SizedBox(
              height: 400,
              width: 110,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/splash.jpg"), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.only(top: 100, ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
