

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget currentWeather(String icon, String temp, String location) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 100,
        width: 120,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/$icon"), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.only(top: 35, ),
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      Text("$temp", style: const TextStyle(fontSize: 46.0),),
      const SizedBox(height: 10.0,),
      Text("$location", style: const TextStyle(fontSize: 25.0, color: Colors.red, fontWeight: FontWeight.bold),)
    ],
  );
}