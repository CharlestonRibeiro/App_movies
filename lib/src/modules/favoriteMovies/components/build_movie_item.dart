import 'package:api_movies/src/common/colors/custom_colors.dart';
import 'package:api_movies/src/common/ulrs/ulrs.dart';
import 'package:api_movies/src/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildMovieItem extends StatelessWidget {
  final MoviesModel movie;
 
  const BuildMovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.04,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  Urls.baseImage + movie.posterPath,
                  height: Get.height * 0.25,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SizedBox(
                width: Get.width * 0.35,
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  softWrap: true,
                ),
              ),
              Text(
                movie.releaseDate.substring(0, 4),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: Get.height * 0.10,
          right: Get.width * 0.11,
          // bottom: 74,
          // right: 46,
          child: Material(
            elevation: 5,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              height: Get.height * 0.04,
              child: IconButton(
                iconSize: Get.height * 0.02,
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outlined,
                  color: CustomColors.gray,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}




