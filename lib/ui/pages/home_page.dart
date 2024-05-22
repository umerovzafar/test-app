import 'package:flutter/material.dart';
import 'package:http_example/domain/models/post_model.dart';
import 'package:http_example/domain/services/api_services.dart';
import 'package:http_example/ui/pages/movies_page.dart';
import 'package:http_example/ui/pages/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePageContent(),
    const WeatherPage(),
    const MoviesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP - Library'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Погода',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Фильмы',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<PostModel?> data = snapshot.data?.allPosts ?? [];

        return ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(
              '${data[index]?.title}',
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: data.length,
        );
      },
    );
  }
}
