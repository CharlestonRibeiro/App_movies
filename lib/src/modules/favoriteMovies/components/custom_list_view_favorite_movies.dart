import 'package:api_movies/src/modules/favoriteMovies/components/build_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_movies/src/models/movies_model.dart';

class CustomListViewFavoriteMovies extends StatelessWidget {
  final List<MoviesModel> favoriteMovies;

  const CustomListViewFavoriteMovies({
    Key? key,
    required this.favoriteMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        padding: const EdgeInsets.all(8.0),
        children: favoriteMovies
            .map((movie) => BuildMovieItem( movie: movie,))
            .toList(),
      );
    });
  }
}
