import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/src/feature/movies/data/model/movie_details_model.dart';
import 'package:test_app/src/feature/movies/data/model/movie_model.dart';

class MovieRepository {
  MovieRepository();

  final urlString = 'https://api.themoviedb.org/3/movie';

  final headers = {
    'accept': 'application/json',
    'Authorization':
        'Bearer ${dotenv.get('THEMOVIEKEY')}',
  };

  Future<(int, MovieModel?)> getPopularMovies({int page = 1}) async {
    final resp = await http.get(
        Uri.parse('$urlString/popular?language=en-US&page=$page'),
        headers: headers);

    if (resp.statusCode == 200) {
      final movieModel = movieModelFromMap(resp.body);
      return (resp.statusCode, movieModel);
    }
    return (resp.statusCode, null);
  }

  Future<(int, MovieDetailsModel?)> getDetails(String movieId) async {
    final resp = await http.get(Uri.parse('$urlString/$movieId?language=en-US'),
        headers: headers);

    if (resp.statusCode == 200) {
      final movieDetailsModel = movieDetailsModelFromMap(resp.body);

      return (resp.statusCode, movieDetailsModel);
    }
    return (resp.statusCode, null);
  }
}
