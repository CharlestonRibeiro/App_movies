import 'package:api_movies/src/common/colors/custom_colors.dart';
import 'package:api_movies/src/common/widgets/custom_app_bar.dart';
import 'package:api_movies/src/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:api_movies/src/modules/homePage/components/custom_list_view_movies.dart';
import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController moviesController = Get.find<HomeController>();
  static const homePage = '/';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mais populares',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: Get.height * 0.45,
                    child: CustomListViewMovies(
                        movies:
                            moviesController.popularMovies),
                  ),
                  Text(
                    'Top filmes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: Get.height * 0.45,
                    child: CustomListViewMovies(movies: moviesController.topMovies),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
