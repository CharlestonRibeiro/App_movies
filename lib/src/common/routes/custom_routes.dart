import 'package:api_movies/src/modules/favoriteMovies/favorite_movies_bindings.dart';
import 'package:api_movies/src/modules/favoriteMovies/favorite_movies_page.dart';
import 'package:api_movies/src/modules/homePage/home_bindings.dart';
import 'package:api_movies/src/modules/homePage/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> customRoutes = [
  GetPage(
      name: HomePage.homePage, 
      binding: HomeBindings(), 
      page: () => HomePage()),
  GetPage(
      name: FavoriteMoviesPage.favoriteMoviesPage,
      binding: FavoriteMoviesBindings(),
      page: () => const FavoriteMoviesPage()),
];
