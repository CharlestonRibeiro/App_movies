import 'package:api_movies/src/modules/homePage/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final moviesController = Get.find< HomeController>();

  @override
  Widget build(BuildContext context) {
   // final moviesController = controller;
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
