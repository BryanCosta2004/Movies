import 'dart:convert';
import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_model.dart';
import 'constants.dart';

class Api {
  final String _baseUrl = 'https://api.themoviedb.org/3';

  get http => null;

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final List moviesJson = json.decode(response.body)['results'];
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<MovieDetail> fetchMovieDetail(int movieId) async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/$movieId?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
