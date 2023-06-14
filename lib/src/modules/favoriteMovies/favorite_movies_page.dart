import 'package:api_movies/src/common/colors/custom_colors.dart';
import 'package:api_movies/src/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:api_movies/src/common/widgets/custom_list_view_genres.dart';
import 'package:api_movies/src/common/widgets/custom_list_view_movies.dart';
import 'package:api_movies/src/modules/favoriteMovies/favorite_movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({super.key});

  static const favoriteMoviesPage = '/FavoriteMoviesPage';

  @override
  Widget build(BuildContext context) {
    final FavoriteMoviesController favoriteMoviesController =
        Get.find<FavoriteMoviesController>();

    favoriteMoviesController.favoriteMovies();

    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.45,
              child: CustomListViewGenres(
                  genresList: favoriteMoviesController.genres),
            ),
            Text(
              'Filmes Favoritos',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: Get.height * 0.45,
              child: CustomListViewMovies(
                  movies: favoriteMoviesController.favoriteMovies),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
