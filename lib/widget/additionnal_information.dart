import 'package:flutter/cupertino.dart';

TextStyle titleFont = const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);

TextStyle infoFont = const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionnalInformation(
  String desc, String humidity
){
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: titleFont,
                ),
                SizedBox(height: 18.0,),
                Text(
                  "Humidite ",
                  style: titleFont,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$desc",
                  style: infoFont,
                ),
                const SizedBox(height: 18.0,),
                Text(
                  "$humidity ",
                  style: infoFont,
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
