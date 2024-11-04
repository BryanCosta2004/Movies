import 'package:flutter/material.dart';
import 'package:movies/models/movie_detail_model.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  MovieDetailPage({required this.movieId});

  Future<MovieDetail> fetchMovieDetail() async {
    // Substitua pelo código para buscar os detalhes do filme
    // Exemplo de API: TMDb API (https://api.themoviedb.org/3/movie/{movieId}?api_key=YOUR_API_KEY)
    throw UnimplementedError("Adicione o código de fetch aqui");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: FutureBuilder<MovieDetail>(
        future: fetchMovieDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No movie details found'));
          }

          final movie = snapshot.data!;
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Release Date: ${movie.releaseDate}'),
                SizedBox(height: 8),
                Text('Rating: ${movie.voteAverage}'),
                SizedBox(height: 16),
                Text(movie.overview),
                SizedBox(height: 16),
                if (movie.posterPath.isNotEmpty)
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
