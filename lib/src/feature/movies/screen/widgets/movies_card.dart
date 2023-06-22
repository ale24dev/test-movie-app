import 'package:flutter/material.dart';
import 'package:test_app/src/feature/movies/data/model/movie_model.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({
    super.key, required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(12.0)),
      ),
    );
  }
}
