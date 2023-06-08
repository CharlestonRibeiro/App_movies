import 'package:api_movies/src/common/ulrs/ulrs.dart';
import 'package:api_movies/src/models/movies_model.dart';
import 'package:api_movies/src/services/custom_exception.dart';
import 'package:api_movies/src/services/dio_client.dart';
import 'package:get/instance_manager.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final dioClient = Get.put(DioClient());
  final customException = Get.put(CustomException());


  @override
  Future getPopularMovies() async {
    final popularMovies = await dioClient.get( Urls.baseUrl + Urls.urlPopularMovies);

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
    final topRetadeMovies = await dioClient.get(Urls.baseUrl + Urls.urlTopRetadeMovies);

    return topRetadeMovies;
  }
}
