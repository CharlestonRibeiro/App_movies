import 'package:api_movies/src/common/ulrs/ulrs.dart';
import 'package:api_movies/src/repositories/moviesLocal/movies_local_repository.dart';
import 'package:api_movies/src/services/custom_exception.dart';
import 'package:api_movies/src/services/dio_client.dart';
import 'package:get/get.dart';

class MoviesLocalRepositoryImpl implements MoviesLocalRepository {
  final dioClient = Get.put(DioClient());
  final customException = Get.put(CustomException());

  @override
  Future postMoviesLocal({required Map<String, dynamic> data}) async {
    await dioClient.postData(url: Urls.urlLocal, data: data);
  }
  
  @override
  Future getFavoritesMovies() async {
   final favoriteMovies =
        await dioClient.getData(url:  Urls.urlLocal);

    if (customException.responseIsValid(favoriteMovies) == false) {
      return [];
    } else {
      if (favoriteMovies.data != null) {
        return favoriteMovies.data;
      } else {
        return [];
      }
    }
  }
}
