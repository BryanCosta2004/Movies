import 'package:flutter/material.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/pages/movie_detail_page.dart';

class MoviePage extends StatelessWidget {
  final List<MovieModel> movies;
  

  MoviePage({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: Image.network(
              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(movie.title),
            subtitle: Text('Rating: ${movie.voteAverage}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movieId: movie.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

