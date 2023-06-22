import 'package:bloc/bloc.dart';
import 'package:test_app/src/feature/movies/data/model/movie_details_model.dart';
import 'package:test_app/src/feature/movies/data/model/movie_model.dart';
import 'package:test_app/src/feature/movies/data/movie_repository.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieState.initial());

  void getPopularMovies({int? pag}) async {
    emit(state.copyWith(movieStatus: MovieStatus.loading));

    final (statusCode, response) =
        await MovieRepository().getPopularMovies(page: pag ?? 1);

    switch (statusCode) {
      case 200:
        emit(state.copyWith(
            movieModel: response, movieStatus: MovieStatus.success));
        break;
      default:
        emit(state.copyWith(movieStatus: MovieStatus.failed));
    }
  }

  void getDetails({required Movie movie}) async {
    emit(state.copyWith(movieStatus: MovieStatus.loading));

    final (statusCode, response) =
        await MovieRepository().getDetails(movie.id.toString());

    switch (statusCode) {
      case 200:
        emit(state.copyWith(
            movieSelected: response, movieStatus: MovieStatus.success));
        break;
      default:
        emit(state.copyWith(movieStatus: MovieStatus.failed));
    }
  }
}
