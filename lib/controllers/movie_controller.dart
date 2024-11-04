import 'package:flutter/material.dart';
import 'package:movies/controllers/movie_service.dart';
import 'package:movies/models/movie_model.dart';

class MovieController with ChangeNotifier {
  List<MovieModel> _movies = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<MovieModel> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final MovieService _movieService = MovieService();

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await _movieService.fetchMovies();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to fetch movies: $e';
      _movies = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}