import 'dart:convert';

import 'package:movie_list/domain/models/genres.dart';

class Movie {
  String title;
  String overview;
  String? backdropPath;
  int id;
  Movie.fromJson(Map json)
      : title = json['original_title'],
        overview = json["overview"],
        id = json["id"],
        backdropPath = json["backdrop_path"];

  @override
  String toString() {
    return "{title: $title, overview: $overview, backgropPath: $backdropPath}";
  }
}

class MovieDetails {
  String backgropPath;
  int budget;
  String title;
  String overview;
  double popularity;
  String releaseDate;
  String posterPath;
  List<Genre> genres;
  MovieDetails(this.title, this.budget, this.backgropPath, this.overview, this.popularity,
      this.posterPath, this.genres, this.releaseDate);
  factory MovieDetails.fromJson(Map json) {
    final title = json["original_title"] as String;
    final budget = json["budget"] as int;
    final backgropPath = json["backdrop_path"] as String;
    final overview = json["overview"] as String;
    final popularity = json["popularity"] as double;
    final posterPath = json["poster_path"] as String;
    final genres = json["genres"] as List<dynamic>;
    final releaseDate = json["release_date"] as String;

    return MovieDetails(title, budget, backgropPath, overview, popularity, posterPath,
        genres.map((e) => Genre.fromJson(e)).toList(), releaseDate);
  }
}

class MovieData {
  int page;
  List<Movie> movies;

  MovieData(this.page, this.movies);
  factory MovieData.fromJson(Map json) {
    final page = json['page'] as int;
    final results = json['results'] as List<dynamic>;

    final movies = results.map((jsonMovie) => Movie.fromJson(jsonMovie)).toList();

    return MovieData(page, movies);
  }

  @override
  String toString() {
    return "page: $page, results $movies";
  }
}
