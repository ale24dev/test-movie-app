import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/constants/constants.dart';
import 'package:test_app/src/feature/movies/cubit/movie_cubit.dart';
import 'package:test_app/src/feature/movies/data/model/movie_model.dart';
import 'package:test_app/src/utils/dateformats.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  void initState() {
    context.read<MovieCubit>().getDetails(movie: widget.movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.title),
        ),
        body: BlocBuilder<MovieCubit, MovieState>(builder: (context, state) {
          switch (state.movieStatus) {
            case MovieStatus.loading:
              const Center(
                child: CircularProgressIndicator(),
              );
              break;
            case MovieStatus.failed:
              const Center(
                child: Text('Error'),
              );
            default:
              final movieSelected = state.movieSelected!;
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Image.network(
                        '${Constants.utlImage}${movieSelected.backdropPath}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Description: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber[300],
                                    ),
                                    const SizedBox.square(
                                      dimension: 5,
                                    ),
                                    Text(
                                        movieSelected.voteAverage
                                            .toStringAsFixed(1)
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                                const SizedBox.square(
                                  dimension: 12,
                                ),
                                Row(
                                  children: [
                                    const Text('Votes:'),
                                    const SizedBox.square(
                                      dimension: 3,
                                    ),
                                    Text(
                                      movieSelected.voteCount.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox.square(
                          dimension: 5,
                        ),
                        Text(
                          movieSelected.overview,
                        ),
                        const SizedBox.square(
                          dimension: 5,
                        ),
                        _destructDetail(
                            title: 'Genres: ', list: movieSelected.genres),
                        _detailsTile(
                            title: 'Release date: ',
                            text: AppDateFormats.formatDMY(
                                movieSelected.releaseDate)),
                        _detailsTile(
                            title: 'Status: ', text: movieSelected.status),
                        _destructDetail(
                            title: 'Languages: ',
                            list: movieSelected.spokenLanguages),
                      ],
                    ),
                  )
                ],
              );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }
}

Widget _detailsTile({required String title, required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Text(title),
        Text(
          text,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    ),
  );
}

Widget _destructDetail({required String title, required List<dynamic> list}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Genres: ', style: TextStyle(fontWeight: FontWeight.w500)),
        Expanded(
          child: Wrap(
            children: list.asMap().entries.map((entry) {
              int index = entry.key;
              final genre = entry.value;
              return Wrap(
                children: [
                  Text(
                    genre.name,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  if (index != list.length - 1)
                    const Text(' - ', style: TextStyle(color: Colors.grey)),
                ],
              );
            }).toList(),
          ),
        )
      ],
    ),
  );
}
