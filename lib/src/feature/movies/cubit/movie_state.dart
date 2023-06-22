part of 'movie_cubit.dart';

enum MovieStatus { initial, loading, success, failed }

class MovieState {
  final MovieStatus movieStatus;
  final MovieModel? movieModel;

  MovieState({required this.movieStatus, this.movieModel});

  factory MovieState.initial() => MovieState(movieStatus: MovieStatus.initial);

  MovieState copyWith(
          {MovieStatus? movieStatus, MovieModel? movieModel}) =>
      MovieState(
          movieStatus: movieStatus ?? this.movieStatus,
          movieModel: movieModel ?? this.movieModel);
}
