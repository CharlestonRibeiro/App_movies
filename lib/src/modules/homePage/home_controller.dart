import 'package:api_movies/src/models/movies_model.dart';
import 'package:api_movies/src/repositories/movies/movies_repository_impl.dart';
import 'package:api_movies/src/repositories/moviesLocal/movies_local_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final popularMovies = <MoviesModel>[].obs;
  final topMovies = <MoviesModel>[].obs;
  final _moviesRepository = Get.find<MoviesRepositoryImpl>();
  final _moviesLocalRepository = Get.find<MoviesLocalRepositoryImpl>();

  @override
  void onInit() {
    super.onInit();
    searchPopularMovies();
    searchTopMovies();
  }

  @override
  void onReady() async {
    Get.snackbar(
      'Bem-vindo!!!',
      'Carregando...',
      icon: const Icon(Icons.cached_outlined),
    );
    super.onReady();
  }

  Future searchPopularMovies() async {
    try {
      final popularMoviesData = await _moviesRepository.getPopularMovies();
      final popularMoviesList = (popularMoviesData as List)
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();
      popularMovies.assignAll(popularMoviesList);

    } catch (e) {
      Get.snackbar(
        'Filmes Populares',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future searchTopMovies() async {
    try {
      final topMoviesData = await _moviesRepository.getTopRetadeMovies();
      final topMoviesList = (topMoviesData as List)
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();

      topMovies.assignAll(topMoviesList);
      
    } catch (e) {
      Get.snackbar(
        'Filmes Populares',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future postMoviesLocal({required Map<String, dynamic> data}) async {
    try {
      _moviesLocalRepository.postMoviesLocal(data: data);

      Get.snackbar(
        'Favorito',
        'Carregado com sucesso!!!',
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      Get.snackbar(
        'Favorito',
        'Erro',
        snackPosition: SnackPosition.TOP,
        icon: const Icon(Icons.cached_outlined),
        duration: const Duration(seconds: 3),
      );
    }
  }

 
}
