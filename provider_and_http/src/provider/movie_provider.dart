import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_practice/src/model/movie.dart';
import 'package:flutter_provider_practice/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  loadMovies() async {
    List<Movie> listMovies = await _movieRepository.loadMovied();
    _movies = listMovies;
    notifyListeners();
  }
}
