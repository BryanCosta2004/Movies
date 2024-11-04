import 'package:movies/core/api.dart';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_model.dart';

class MovieRepository {
  final Api _api = Api();

  // Retorna uma lista de filmes populares
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      return await _api.fetchMovies();
    } catch (e) {
      print('Error fetching popular movies: $e');
      rethrow;
    }
  }

  // Retorna os detalhes de um filme específico
  Future<MovieDetail> getMovieDetail(int movieId) async {
    try {
      return await _api.fetchMovieDetail(movieId);
    } catch (e) {
      print('Error fetching movie details: $e');
      rethrow;
    }
  }
}
