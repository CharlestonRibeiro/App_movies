//import 'package:device_preview/device_preview.dart';

import 'package:api_movies/src/common/routes/custom_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_movies/src/common/themeData/custom_theme_data.dart';



class AppMovies extends StatelessWidget {
  const AppMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,

      title: 'AppMovies',
      debugShowCheckedModeBanner: false,
      theme: customThemeData(),
      getPages: customRoutes,
    );
  }
}