import 'package:api_movies/src/models/movies_model.dart';
import 'package:api_movies/src/services/custom_exception.dart';
import 'package:api_movies/src/services/dio_client.dart';
import 'package:get/instance_manager.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final dioClient = Get.put(DioClient());
  final customException = Get.put(CustomException());
  // final verifyResponse = Get.put(VerifyResponse());

  static const urlPopularMovies =
      'popular?api_key=77fcf345c0aaa5c563bb5ea8fe9102c6&language=pt-br&page=1';
  static const urlTopRetadeMovies =
      'top_rated?api_key=77fcf345c0aaa5c563bb5ea8fe9102c6&language=pt-br&page=1';
  static const baseUrl = 'https://api.themoviedb.org/3/movie/';

  @override
  Future getPopularMovies() async {
    final popularMovies = await dioClient.get(baseUrl + urlPopularMovies);

    if (customException.responseIsValid(popularMovies) == false) {
      return [];
    } else {
      if (popularMovies.data != null) {
        return popularMovies.data['results'];
      } else {
        return [];
      }
    }
  }

  @override
  Future<List<MoviesModel>> getTopRetadeMovies() async {
    final topRetadeMovies = await dioClient.get(baseUrl + urlTopRetadeMovies);

    return topRetadeMovies;
  }
}
