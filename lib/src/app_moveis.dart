import 'package:api_movies/src/modules/homePage/home_bindings.dart';
import 'package:api_movies/src/modules/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMovies extends StatelessWidget {
  const AppMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AppMovies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/', 
          binding: HomeBindings(),
          page: () => const HomePage() 
          ),
      ],
    );
  }
}