import 'package:flutter/material.dart';

class AppMovies extends StatelessWidget {
  const AppMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppMovies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: null,
    );
  }
}