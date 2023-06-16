import 'package:api_movies/src/common/colors/custom_colors.dart';
import 'package:api_movies/src/common/ulrs/ulrs.dart';
import 'package:api_movies/src/models/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListViewFavoriteMovies extends StatelessWidget {

  final List<MoviesModel> favoriteMovies;

  const CustomListViewFavoriteMovies({ super.key, required this.favoriteMovies });

   @override
   Widget build(BuildContext context) {
        return Obx(() {
      return ListView.builder(
        
    //    scrollDirection: Axis.horizontal,
        

        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        Urls.baseImage + favoriteMovies[index].posterPath,
                        height: Get.height * 0.25,
                        //  width: Get.width * 0.32,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                      width: Get.width * 0.35,
                      child: Text(
                        favoriteMovies[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                        softWrap: true,
                      ),
                    ),
                    Text(
                      favoriteMovies[index].releaseDate.substring(0, 4),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 82,
                  right: 20,
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
                            // moviesFavorite.favoriteMovies[index].favorite == true
                            //     ? CustomColors.primary
                            //     : CustomColors.gray,
                          )),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}