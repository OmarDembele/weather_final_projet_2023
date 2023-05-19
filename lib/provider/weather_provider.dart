import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:weather_final_projet_2023/models/weather_models.dart';
import 'package:weather_final_projet_2023/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherAppClient _client = WeatherAppClient();
  final List<Weather> _list = [];
  bool isLoading = false;
  int get value_list => _list.length;
  List<Weather> get list => _list;
  late String _city;
  String get city => _city;
  Timer? _timer;

  WeatherProvider() {
    _city = 'Rennes';
    startTimer();
  }

  void startTimer() {
    const duration = Duration(seconds: 10);
    _timer = Timer.periodic(duration, (timer) {
      if (_list.length < 5) {
        fetchWeather();
        updateCity();
      } else {
        _timer?.cancel();
      }
    });
  }

  void updateCity() {
    switch (_list.length) {
      case 0:
        _city = 'Rennes';
        break;
      case 1:
        _city = 'Paris';
        break;
      case 2:
        _city = 'Nantes';
        break;
      case 3:
        _city = 'Bordeaux';
        break;
      case 4:
        _city = 'Lyon';
        break;
      default:
        _city = '';
        break;
    }
  }

  Future<void> fetchWeather() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _client.getCurrentWeather(_city);
      if (response != null) {
        _list.add(response);
      }
    } catch (error) {
        throw("Error");
    }

    isLoading = false;
    notifyListeners();
  }

  void restart() {
    _list.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

/*
final List<String> _messages = [
  'Nous téléchargeons les données...',
  'C\'est presque fini...',
  'Plus que quelques secondes avant d\'avoir le résultat...'
];

void startTimer() {
  const duration = Duration(seconds: 10);
  _timer = Timer.periodic(duration, (timer) {
    fetchWeather();
    updateCity();
  });

  /*const messageDuration = Duration(seconds: 6);
    Timer.periodic(messageDuration, (timer) {
      updateMessageIndex();
    });*/
}


/void updateMessageIndex() {
    _messageIndex = (_messageIndex + 1) % _messages.length;
    notifyListeners();
  }

String getCurrentMessage() {
    return _messages[_messageIndex];
  }




*/
