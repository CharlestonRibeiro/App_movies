import 'package:api_movies/src/common/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FavoriteMoviesPage extends StatelessWidget {

  const FavoriteMoviesPage({ super.key });

  static const favoriteMoviesPage = '/FavoriteMoviesPage';

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           body: Container(),
           bottomNavigationBar: const CustomBottomNavigationBar(),
       );
  }
}