import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_list/domain/models/Movie.dart';
import 'package:movie_list/services/movie_service.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.id});
  final int id;
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final service = MovieService();
  MovieDetails? movie;
  @override
  void initState() {
    super.initState();
    service.getMovie(widget.id).then((value) {
      setState(() {
        movie = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
      ),
      body: movie != null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${movie?.title}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0),),
                  Image.network(
                    "https://image.tmdb.org/t/p/original/${movie?.backgropPath}",
                    width: 600,
                    height: 600,
                  )
                ],
              ),
            )
          : Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: const [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text("Carregando")),
              CircularProgressIndicator()
            ])),
    );
  }
}
