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

  MovieDetails.fromJson(Map json)
      : title = json["original_title"],
        budget = json["budget"],
        backgropPath = json["backdrop_path"],
        overview = json["overview"],
        popularity = json["popularity"],
        releaseDate = json["release_date"];
}

class MovieData {
  int page;
  List<Movie> movies;

  MovieData(this.page, this.movies);
  factory MovieData.fromJson(Map json) {
    final page = json['page'] as int;
    final results = json['results'] as List<dynamic>;

    final movies =
        results.map((jsonMovie) => Movie.fromJson(jsonMovie)).toList();

    return MovieData(page, movies);
  }

  @override
  String toString() {
    return "page: $page, results $movies";
  }
}
