import 'package:flutter/material.dart';
import 'package:test_app/src/feature/movies/screen/widgets/movies_card.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Movies App'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(index == 0)
                const Text('Popular Movies', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                const  MoviesCard(),
              ],
            );
          },
        ),
      ),
    );
  }
}
