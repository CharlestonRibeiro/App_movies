import 'package:api_movies/src/common/ulrs/ulrs.dart';
import 'package:api_movies/src/services/custom_exception.dart';
import 'package:api_movies/src/services/dio_client.dart';
import 'package:get/instance_manager.dart';

import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  
  final dioClient = Get.put(DioClient());
  final customException = Get.put(CustomException());

  @override
  Future getPopularMovies() async {
    final popularMovies =
        await dioClient.getData(url:  Urls.baseUrl + Urls.urlPopularMovies);

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
  Future getTopRetadeMovies() async {
    final topRetadeMovies =
        await dioClient.getData(url: Urls.baseUrl + Urls.urlTopRetadeMovies);
    if (customException.responseIsValid(topRetadeMovies) == false) {
      return [];
    } else {
      if (topRetadeMovies.data != null) {
        return topRetadeMovies.data['results'];
      } else {
        return [];
      }
    }
  }
  
  @override
  Future getGenres() async {
      final getGenres =
        await dioClient.getData(url: Urls.urlGenres);
    if (customException.responseIsValid(getGenres) == false) {
      return [];
    } else {
      if (getGenres.data != null) {
        return getGenres.data['genres'];
      } else {
        return [];
      }
    }
  }
}
