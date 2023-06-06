import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:api_movies/src/repositories/movies_repository_impl.dart';
import 'package:get/instance_manager.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(MoviesRepositoryImpl());
    Get.put(HomeController());
  }
}
