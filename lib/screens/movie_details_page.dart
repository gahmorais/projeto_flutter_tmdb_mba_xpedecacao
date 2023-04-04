import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_list/domain/models/Movie.dart';
import 'package:movie_list/view_models/movie_detais_viewmodel.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({super.key, required this.id});
  final int id;
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final viewModel = MovieDetailsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes"),
        ),
        body: StreamBuilder<MovieDetails>(
          stream: viewModel.movieStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data!;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    Image.network("https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                    Center(
                      child: Text(
                        "${movie.title} - ${movie.releaseDate.split("-")[0]}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...movie!.genres
                              .map((genre) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(genre.name)))
                              .toList(),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Popularidade: ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text("${movie.popularity}"),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Orçamento: ",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(movie.budget > 0 ? currencyFormat(movie.budget) : "Indefinido")
                      ],
                    ),
                    const Divider(
                      thickness: 2.0,
                      color: Colors.grey,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20.0), child: Text(movie.overview))
                  ],
                ),
              );
            }
            return Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: const [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0), child: Text("Carregando")),
              CircularProgressIndicator()
            ]));
          },
        ));
  }

  String currencyFormat(int value) {
    final format = NumberFormat.currency(locale: "en_US", symbol: "\$ ");
    return format.format(value);
  }
}


//           : 
