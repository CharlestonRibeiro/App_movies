import 'dart:developer';

import 'package:api_movies/src/models/genres_model.dart';
import 'package:api_movies/src/models/movies_model.dart';
import 'package:api_movies/src/repositories/movies/movies_repository_impl.dart';
import 'package:api_movies/src/repositories/moviesLocal/movies_local_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesController extends GetxController {
  final _moviesRepository = Get.find<MoviesRepositoryImpl>();
  final _moviesLocalRepository = Get.find<MoviesLocalRepositoryImpl>();

  final favoriteMovies = <MoviesModel>[].obs;
  final genres = <GenresModel>[].obs;

  @override
  void onInit() {
    super.onInit();
   
    searchGenres();
  }

  @override
  void onReady() async {
    Get.snackbar(
      'Bem-vindo!!!',
      'Carregando...',
      icon: const Icon(Icons.cached_outlined),
    );
    searchFavoritesMovies();
    super.onReady();
  }

  Future searchFavoritesMovies() async {
    try {
      final favoritesMoviesData =
          await _moviesLocalRepository.getFavoritesMovies();
      final favoritesMoviesList = (favoritesMoviesData as List)
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();

      favoriteMovies.assignAll(favoritesMoviesList);

      log(favoritesMoviesList.toString());

      Get.snackbar(
        'Filmes Favoritos',
        'Carregado com sucesso!!!',
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Filmes Favoritos',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future searchGenres() async {
    try {
      final genresData = await _moviesRepository.getGenres();

      final geresList = (genresData as List)
          .map((geresMap) => GenresModel.fromMap(geresMap))
          .toList();

      genres.assignAll(geresList);

      Get.snackbar(
        'Filtros',
        'Carregado com sucesso!!!',
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Filtros',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }
}
