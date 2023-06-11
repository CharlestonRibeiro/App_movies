import 'package:api_movies/src/services/custom_exception.dart';
import 'package:api_movies/src/services/rest_client_interface.dart';
import 'package:dio/dio.dart';

class DioClient implements IRestClient {
 final Dio _dio = Dio();

   BaseOptions options = BaseOptions(
    headers: {
      'Content-Type': 'application/json',
    },
  );

  @override
  Future getData({required String url}) async {
     try {
      final response = await _dio.get(url);
      return response;
    } on DioError catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }
}
