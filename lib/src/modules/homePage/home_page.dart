import 'package:api_movies/src/common/colors/custom_colors.dart';
import 'package:api_movies/src/common/widgets/custom_app_bar.dart';
import 'package:api_movies/src/modules/homePage/components/popular_movies.dart';
import 'package:api_movies/src/modules/homePage/components/top_movies.dart';
import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController moviesController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mais populares',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: Get.height * 0.45, 
                    child: PopularMovies(),
                  ),
                  Text(
                    'Top filmes',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: Get.height * 0.45, 
                    child: TopMovies(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:api_movies/src/common/colors/custom_colors.dart';
// import 'package:api_movies/src/common/widgets/custom_app_bar.dart';
// import 'package:api_movies/src/modules/homePage/components/popular_movies.dart';
// import 'package:api_movies/src/modules/homePage/components/top_movies.dart';
// import 'package:api_movies/src/modules/homePage/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);

//   final HomeController moviesController = Get.find<HomeController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.background,
//       body:   Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const CustomAppBar(),
//                 Text('Mais populares',
//                     style: Theme.of(context).textTheme.titleLarge),
//                 PopularMovies(),
//                 Text('Top filmes', style: Theme.of(context).textTheme.titleLarge),
//                 TopMovies(),
//               ],
//             ),
      
//     );
//   }
// }
