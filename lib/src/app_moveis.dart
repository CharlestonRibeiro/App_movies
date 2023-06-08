import 'package:api_movies/src/common/themeData/custom_theme_data.dart';
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
      debugShowCheckedModeBanner: false,
      theme: customThemeData(),
      getPages: [
        GetPage(
          name: '/', 
          binding: HomeBindings(),
          page: () =>   HomePage() 
          ),
      ],
    );
  }
}