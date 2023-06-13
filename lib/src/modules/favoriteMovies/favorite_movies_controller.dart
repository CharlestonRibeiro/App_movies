import 'package:api_movies/src/models/genres_model.dart';
import 'package:api_movies/src/repositories/movies_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesController extends GetxController {

final _moviesRepository = Get.find<MoviesRepositoryImpl>();
  
 final genres = <GenresModel>[].obs;

  @override
  void onReady() async {
    Get.snackbar(
      'Bem-vindo!!!',
      'Carregando...',
      icon: const Icon(Icons.cached_outlined),
    );

    searchGenres();
    super.onReady();
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