import 'dart:async';

import 'package:movie_list/services/movie_service.dart';

import '../domain/models/Movie.dart';

class HomeViewModel {
  int _currentPage = 1;
  final MovieService _service = MovieService();
  final List<Movie> _listMovies = [];
  final streamController = StreamController<List<Movie>>();

  void getMovies() {
    _service.getMovies(page: _currentPage).then((value) {
      _listMovies.addAll(value);
      streamController.sink.add(_listMovies);
      _currentPage++;
    });
  }
}
