import 'package:movies/models/movie_model.dart';

class MovieResponse {
  final int page;
  final List<MovieModel> results;
  final int totalResults;
  final int totalPages;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'],
      results: (json['results'] as List).map((item) => MovieModel.fromJson(item)).toList(),
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
    );
  }
}