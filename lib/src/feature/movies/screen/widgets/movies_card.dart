import 'package:flutter/material.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({
    super.key,
  });

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
