import 'package:api_movies/src/modules/favoriteMovies/favorite_movies_controller.dart';
import 'package:api_movies/src/repositories/movies/movies_repository_impl.dart';
import 'package:api_movies/src/repositories/moviesLocal/movies_local_repository_impl.dart';
import 'package:get/get.dart';

class FavoriteMoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesLocalRepositoryImpl());
    Get.put(MoviesRepositoryImpl());
    Get.put(FavoriteMoviesController());
    Get.put(FavoriteMoviesController().FavoriteMoviesBindings());
  }
}