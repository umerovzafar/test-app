import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_example/domain/services/api_services.dart';
import 'package:http_example/ui/app.dart';

Future<void> main(List<String> args) async {
  dotenv.load(fileName: ".env");

  await ApiServices.getMovies();
  runApp(const MyApp());
}
