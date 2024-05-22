import 'package:flutter/material.dart';
import 'package:http_example/domain/models/coords_model.dart';
import 'package:http_example/domain/models/weather_model.dart';
import 'package:http_example/domain/services/api_services.dart';

final class AppProvider extends ChangeNotifier {
  WeatherData? _weatherData;
  WeatherData? get weatherData => _weatherData;

  CoordsData? _coordsData;
  CoordsData? get coordsData => _coordsData;

  Future<WeatherData?> setUp() async {
    _coordsData = await ApiServices.getCoords();
    _weatherData = await ApiServices.getWeather(_coordsData);
    print(_weatherData?.timezone );
    return _weatherData;
  }
}
