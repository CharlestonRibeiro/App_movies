import 'package:api_movies/src/common/colors/custom_colors.dart';
import 'package:api_movies/src/modules/favoriteMovies/favorite_movies_controller.dart';
import 'package:api_movies/src/modules/favoriteMovies/favorite_movies_page.dart';
import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:api_movies/src/modules/homePage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteMoviesController = Get.put(FavoriteMoviesController());

    return GetBuilder<HomeController>(
      builder: (controller) {
        final route = Get.routing.current;
        final selectedIndex = route == HomePage.homePage ? 0 : 1;

        return BottomNavigationBar(
          backgroundColor: CustomColors.background,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_movies),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Filmes Favoritos',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: CustomColors.primary,
          unselectedItemColor: CustomColors.gray,
          onTap: (index) {
            if (index == 0) {
              Get.toNamed(HomePage.homePage);
            } else if (index == 1) {
              favoriteMoviesController.searchFavoritesMovies();
              Get.toNamed(FavoriteMoviesPage.favoriteMoviesPage);
            }
          },
        );
      },
    );
  }
}


//final favoriteMoviesController = Get.put(FavoriteMoviesController());

// favoriteMoviesController.favoriteMovies();