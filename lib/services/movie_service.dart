import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/models/Movie.dart';

class MovieService {
  static const KEY = String.fromEnvironment("API_KEY", defaultValue: "");
  Future<List<Movie>> getMovies({int page = 1}) async {
    Map<String, dynamic> parameter = {"api_key": KEY, "page": "$page"};
    var url = Uri.https("api.themoviedb.org", "/3/movie/popular", parameter);
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return MovieData.fromJson(json).movies;
  }
}
