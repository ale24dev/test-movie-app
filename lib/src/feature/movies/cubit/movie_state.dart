part of 'movie_cubit.dart';

enum MovieStatus { initial, loading, success, failed }

class MovieState {
  final MovieStatus movieStatus;
  final MovieModel? movieModel;
  final MovieDetailsModel? movieSelected;

  MovieState({required this.movieStatus, this.movieModel, this.movieSelected});

  factory MovieState.initial() => MovieState(movieStatus: MovieStatus.initial);

  MovieState copyWith(
          {MovieStatus? movieStatus,
          MovieModel? movieModel,
          MovieDetailsModel? movieSelected}) =>
      MovieState(
        movieStatus: movieStatus ?? this.movieStatus,
        movieModel: movieModel ?? this.movieModel,
        movieSelected: movieSelected ?? this.movieSelected,
      );
}
