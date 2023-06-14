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
}
