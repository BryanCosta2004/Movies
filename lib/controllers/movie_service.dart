import 'dart:convert';

import 'package:movies/models/movie_detail_model.dart';
import 'package:movies/models/movie_model.dart';

class MovieService {
  final String _apiKey = 'YOUR_API_KEY';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  get http => null;

  Future<List<MovieModel>> fetchMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final List moviesJson = json.decode(response.body)['results'];
      return moviesJson.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<MovieDetail> fetchMovieDetail(int movieId) async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/$movieId?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}