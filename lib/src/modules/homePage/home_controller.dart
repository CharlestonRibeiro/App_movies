import 'package:api_movies/src/models/movies_model.dart';
import 'package:api_movies/src/repositories/movies_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final movies = [].obs;
  final _moviesRepository = Get.find<MoviesRepositoryImpl>();


  @override
  void onReady() async {
    searchPopularMovies();
    super.onReady();
  }

  Future searchPopularMovies() async {
    Get.snackbar(
        'Filmes Populares',
        'Carregando',
        icon: const Icon(Icons.cached_outlined),
    );

    try {
      final moviesData = await _moviesRepository.getPopularMovies();
      final movieList = (moviesData as List)
          .map((movieMap) => MoviesModel.fromMap(movieMap))
          .toList();
      movies.assignAll(movieList);

      Get.snackbar(
          'Filmes Populares',
          'Carregado com sucesso!!!',
          icon: const Icon(Icons.cached_outlined),
          duration: const Duration(seconds: 3),      
      );

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
}
