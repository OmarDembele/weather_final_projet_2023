import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_final_projet_2023/models/weather_models.dart';
import 'package:weather_final_projet_2023/provider/weather_provider.dart';
import 'package:weather_final_projet_2023/widget/additionnal_information.dart';
import 'package:weather_final_projet_2023/widget/current_weather.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isSliderVisible = true;
  double _value = 0;
  int _messageIndex = 0;
  int countryIndex = 0;
  Timer? timer;
  WeatherProvider provider = WeatherProvider();
  late int value ;

  final List<String> _messages = [
    'Nous téléchargeons les données...',
    'C\'est presque fini...',
    ' Plus que quelques secondes avant d’avoir les résultats...'
  ];

  Future<void> startLoading() async {
    for ( int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 600,));
      setState(() {
        _value = i.toDouble();
      });
      if (!isSliderVisible) {
        // Chargement terminé, arrête la temporisation
        break;
      }
    }
    setState(() {
      isSliderVisible = false;
      timer?.cancel();
    });
  }

  void resetLoading() {
    setState(() {
      isSliderVisible = true;
      startLoading();
      loadData();
      provider.restart();
    });
  }
  Future<void> loadData() async{
    timer = Timer.periodic(const Duration(seconds: 6), ( timer) {
      setState(() {
        _messageIndex = (_messageIndex + 1) % _messages.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
      startLoading();
      loadData();
    //timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context).list;

    return Scaffold(
        backgroundColor: Colors.teal[100],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Visibility(
                visible: !isSliderVisible,
                child: Column(
                  children: [
                   ElevatedButton(
                  onPressed: resetLoading,
                  child: const Text('Recommencer', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                ),
              Column(
                children: [
                  const SizedBox(height: 10,),
                  FutureBuilder(
                    future: Future.microtask(() => weatherProvider.isNotEmpty ? weatherProvider : null),
                    builder: (BuildContext context, AsyncSnapshot<List<Weather>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          final dataList = snapshot.data!;
                          return Column(
                            children: dataList.map((weather) {
                              return Column(
                                children: [
                                  const Text("----------------------------------------------------------------------------------------------------"),
                                  currentWeather("${weather.icon}.png", "${weather.temp}°C", weather.cityName),
                                  const SizedBox(height: 30.0,),
                                  const Text(
                                    "Information Supplementaire",
                                    style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 20.0,),
                                  additionnalInformation(weather.description, "${weather.humidity}"),

                                ],
                              );
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("An error occurred: ${snapshot.error}"),
                          );
                        } else {
                          return const Center(
                            child: Text("No data available"),
                          );
                        }
                      } else {
                        return Container();
                      }
                    },
                  ),
                ],
              )
                  ],
                )
              ),
              const SizedBox(height: 250),
              Visibility(
                  visible: isSliderVisible,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Chargement", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      SliderTheme(
                        data: const SliderThemeData(
                            trackHeight: 40,
                            activeTickMarkColor: Colors.lightBlue,
                            inactiveTrackColor: Colors.red,
                            inactiveTickMarkColor: Colors.white
                        ),
                        child: Slider(
                          value: _value,
                          min: 0,
                          max: 100,
                          inactiveColor: Colors.red,
                          activeColor: Colors.blue,
                          onChanged: null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text('${_value.toInt()}%', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        _messages[_messageIndex],
                        style: const TextStyle(fontSize: 28,),
                      ),
                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}
