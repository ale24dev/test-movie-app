import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/src/feature/movies/cubit/movie_cubit.dart';
import 'package:test_app/src/feature/movies/screen/movies_screen.dart';

void main() {
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
