import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_example/domain/models/coords_model.dart';
import 'package:http_example/domain/models/post_model.dart';

import 'package:http/http.dart' as http;
import 'package:http_example/domain/models/weather_model.dart';

abstract final class ApiServices {
  static Future<PostList?> getPosts() async {
    //
    // https://jsonplaceholder.typicode.com/posts
    try {
      await Future.delayed(const Duration(seconds: 2));

      final http.Response response = await http.get(
        Uri(
          scheme: 'https',
          host: "jsonplaceholder.typicode.com",
          path: '/posts',
        ),
      );
      // final jsonData = await json.decode(response.body);
      // print(jsonData.runtimeType);
      final jsonData = await json.decode(utf8.decode(response.bodyBytes));
      final PostList data = PostList.fromJson(jsonData);

      return data;
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<CoordsData?> getCoords() async {
    try {
      final response = await http.get(
        Uri(
          scheme: 'http',
          host: 'api.openweathermap.org',
          path: 'geo/1.0/direct',
          queryParameters: <String, dynamic>{
            'q': 'tashkent',
            'appid': 'b6ce6ae36b30f3367c6b4499ed8932a6',
          },
        ),
      );

      final jsonData = await json.decode(utf8.decode(response.bodyBytes));

      final data = CoordsData.fromJson(jsonData);

      return data;
    } catch (e) {
      e;
    }
  }

  static Future<WeatherData?> getWeather(CoordsData? coords) async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=55.7522&lon=37.6156&exclude=hourly,minutely&appid=49cc8c821cd2aff9af04c9f98c36eb74',
        ),
      );
      final jsonData = await json.decode(utf8.decode(response.bodyBytes));
      final data = WeatherData.fromJson(jsonData);
      return data;
    } catch (e) {
      print(e);
    }
  }

  static Future<String> getMovies() async {



      final Dio dio = Dio();

      final  response = await dio.get(
          'https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1',
          options: Options(headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NTFhMzIxOTNhMDVmNDNlZDZmZTQ1MjRhNWE2NGVjMyIsInN1YiI6IjYzMTU4MGJlYTQwMmMxMDA3YWJmZjFmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.gJxsq2R64Mb8wWmwsYnfSKC3JrehZVLxzE_Ou-Jv0oY',
          }));

      print(response.data.runtimeType);

    return '';
  }
}
