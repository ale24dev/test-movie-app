import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/feature/movies/cubit/movie_cubit.dart';
import 'package:test_app/src/feature/movies/screen/widgets/movies_card.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    context.read<MovieCubit>().getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Movies App'),
      ),
      body: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          switch (state.movieStatus) {
            case MovieStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case MovieStatus.failed:
              return const Center(
                child: Text('Error'),
              );
            default:
              final movieList = state.movieModel!.results;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: movieList.length,
                  itemBuilder: (context, index) {
                    final movie = movieList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (index == 0)
                          const Text(
                            'Popular Movies',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          ),
                        MoviesCard(movie: movie),
                      ],
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
