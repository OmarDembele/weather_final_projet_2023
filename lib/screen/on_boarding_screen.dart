import 'package:flutter/material.dart';
import 'package:weather_final_projet_2023/screen/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white24,
        body: Stack(
          children: [
        Stack(
          children: [

            Container(
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/gif/onBoarding.gif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: 200,
                  width: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: "Welcome to our App",
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold
                                )
                            )
                        ),
                        RichText(
                            text: const TextSpan(
                                text: "Click on Continue",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                )
                            )
                        ),
                      ],
                    ),
                  ),
                )
            ),
            Positioned(
                top: 680,
                left: 0,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              fixedSize: Size(MediaQuery.of(context).size.width, 50)
                          ),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => const HomeScreen())
                            );
                          },
                          child: const Text("Continue",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600
                              )
                          )
                      ),
                    )
                  ],
                ))
          ],
        ),
        ]
      )
    );
  }
}
