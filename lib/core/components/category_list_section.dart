import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/response/movie_response_model.dart';
import 'error_movie_section.dart';

class CategoryListSection extends StatelessWidget {
  final String categoryTitle;
  final List<Movie> movies;
  final double itemWidth;

  const CategoryListSection({
    super.key,
    required this.categoryTitle,
    required this.movies,
    this.itemWidth = 120.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 170.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final movie = movies[index];
              final posterUrl = movie.posterPath != null
                  ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                  : null;

              return Padding(
                padding: EdgeInsets.only(
                  right: index == movies.length - 1 ? 0.0 : 8.0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: itemWidth,
                    color: Colors.grey[800],
                    child: GestureDetector(
                      onTap: () {
                        context.push('/dashboard/movie/${movie.id}');
                      },
                      onLongPress: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${movie.title}"),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
