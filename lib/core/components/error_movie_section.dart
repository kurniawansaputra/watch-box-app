import 'package:flutter/material.dart';

class ErrorMovieSection extends StatelessWidget {
  const ErrorMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Movie Unavailable',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
