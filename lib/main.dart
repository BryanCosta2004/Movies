import 'package:flutter/material.dart';
import 'package:movies/core/theme_app.dart';
import 'package:movies/pages/movie_page.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Adapta-se ao tema do sistema (claro ou escuro)
      debugShowCheckedModeBanner: false,
      home: MoviePage(movies: [],), // Define a página inicial do app
    );
  }
}