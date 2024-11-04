import 'package:flutter/material.dart';
import 'package:movies/controllers/movie_service.dart';
import 'package:movies/models/movie_detail_model.dart';

class MovieDetailController with ChangeNotifier {
  MovieDetail? _movieDetail;
  bool _isLoading = false;
  String? _errorMessage;

  MovieDetail? get movieDetail => _movieDetail;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final MovieService _movieService = MovieService();

  Future<void> fetchMovieDetail(int movieId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _movieDetail = await _movieService.fetchMovieDetail(movieId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to fetch movie details: $e';
      _movieDetail = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
