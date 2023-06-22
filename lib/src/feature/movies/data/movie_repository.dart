
import 'package:http/http.dart' as http;
import 'package:test_app/src/feature/movies/data/model/movie_model.dart';

class MovieRepository {
  MovieRepository();

  final headers = {
    'accept': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyYjdiOWQ3YzY5MjRkZGFiMDU4NDVmOGM0NWVkZTg5ZSIsInN1YiI6IjY0OTUxMjg5OTdlYWI0MDE0NjUzZGVlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.oR2fLx3FKIy2FW98-LwdwHnDB59ASDReH53HK5x9NDA',
  };

  Future<(int, MovieModel?)> getPopularMovies({int page = 1}) async {
    
    final resp = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?language=en-US&page=$page'),
        headers: headers);

    if (resp.statusCode == 200) {

      final  movieModel = movieModelFromMap(resp.body);
      return (resp.statusCode, movieModel);
    }
    return (resp.statusCode, null);
  }
}
