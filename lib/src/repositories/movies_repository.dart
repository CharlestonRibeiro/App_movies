import 'package:api_movies/src/models/movies_model.dart';

abstract class MoviesRepository {
  Future getPopularMovies();
  Future<List<MoviesModel>> getTopRetadeMovies();
}
