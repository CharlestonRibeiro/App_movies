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
  Future get(String url, {Map<String, dynamic>? queryParameters}) async {
     try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      throw CustomException(errorMessage: e.message);
    }
  }
}
