import 'package:flutter/material.dart';
import 'package:test_app/src/constants/constants.dart';
import 'package:test_app/src/feature/movies/data/model/movie_model.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(11, 0, 0, 0),
                  blurRadius: 5,
                  offset: Offset(0, 5))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      movie.originalTitle,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox.square(
                    dimension: 20,
                  ),
                  Text(
                    movie.releaseDate.year.toString(),
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      '${Constants.utlImage}${movie.posterPath}')),
              const SizedBox.square(
                dimension: 10,
              ),
              Text(
                movie.overview,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Ratings(movie: movie),
                  Text(movie.originalLanguage.name)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Ratings extends StatelessWidget {
  const _Ratings({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Text(movie.voteAverage.toString(),
                style: const TextStyle(fontWeight: FontWeight.w500)),
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
              movie.voteCount.toString(),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
