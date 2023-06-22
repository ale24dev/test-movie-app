import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/feature/movies/cubit/movie_cubit.dart';
import 'package:test_app/src/feature/movies/screen/movies_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MovieCubit())],
      child: const MaterialApp(
        home: MoviesScreen(),
      ),
    );
  }
}
