import 'package:flutter/material.dart';
import 'package:movie_app/core/components/error_movie_section.dart';

import '../../../data/models/response/movie_response_model.dart';

class MovieGrid extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onTap;

  const MovieGrid({
    super.key,
    required this.movies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final posterUrl = movie.posterPath != null
            ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
            : null;
        return GestureDetector(
          onTap: () => onTap(movie),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 170.0,
              color: Colors.grey[800],
              child: posterUrl != null
                  ? Image.network(
                      posterUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const ErrorMovieSection();
                      },
                    )
                  : const ErrorMovieSection(),
            ),
          ),
        );
      },
    );
  }
}
