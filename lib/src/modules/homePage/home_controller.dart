import 'package:api_movies/src/models/movies_model.dart';
import 'package:api_movies/src/repositories/movies_repository_impl.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final movies = [].obs;
  final _moviesRepository = Get.find<MoviesRepositoryImpl>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    final moviesData = await _moviesRepository.getPopularMovies();
    final movieList = (moviesData as List).map((movieMap) => MoviesModel.fromMap(movieMap)).toList(); 
    movies.assignAll(movieList);
    
    super.onReady();
  }
}
