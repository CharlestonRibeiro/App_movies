import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final moviesController = controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Obx(() { 
              return ListView.builder(
                itemCount: moviesController.movies.length ,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(moviesController.movies[index].title),
                  );
                });
          }
        )
    );
  }
}
