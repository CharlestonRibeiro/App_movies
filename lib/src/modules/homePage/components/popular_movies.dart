import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularMovies extends StatelessWidget {
  PopularMovies({Key? key}) : super(key: key);

  final HomeController moviesController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final movies = moviesController.movies;
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(
                  height: Get.height * 0.04,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${movies[index].posterPath}',
                    height: Get.height * 0.25,
                    width: Get.width * 0.32,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  width: Get.width * 0.32,
                  child: Text(
                    movies[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                    softWrap: true,
                  ),
                ),
                Text(
                  movies[index].releaseDate.substring(0, 4),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
