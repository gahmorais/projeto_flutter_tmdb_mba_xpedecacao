import 'dart:async';

import 'package:movie_list/domain/models/Movie.dart';
import 'package:movie_list/services/movie_service.dart';

class MovieDetailsViewModel {
  final service = MovieService();
  final movieStreamController = StreamController<MovieDetails>();
  void getMovie(int id) {
    service.getMovie(id).then((value) {
      movieStreamController.sink.add(value);
    });
  }
}
