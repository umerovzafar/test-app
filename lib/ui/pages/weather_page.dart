import 'package:flutter/material.dart';
import 'package:http_example/domain/models/coords_model.dart';
import 'package:http_example/domain/models/weather_model.dart';
import 'package:http_example/domain/provider/app_provider.dart';
import 'package:http_example/domain/services/api_services.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildContent(
      BuildContext context,
      AsyncSnapshot<WeatherData?> snapshot,
    ) {
      switch (snapshot.connectionState) {
        case ConnectionState.done:
          return const WeatherPageContent();
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    }

    return FutureBuilder(
      future: context.read<AppProvider>().setUp(),
      builder: (context, snapshot) => _buildContent(context, snapshot),
    );
  }
}

class WeatherPageContent extends StatelessWidget {
  const WeatherPageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppProvider model = Provider.of<AppProvider>(context);
    return Center(
      child: Text(model.weatherData?.timezone ?? 'Error'),
    );
  }
}
