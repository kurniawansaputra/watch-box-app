import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/home/bloc/search_movie/search_movie_bloc.dart';

import 'movie_grid.dart';
import 'shimmer_grid.dart';

class ResultMoviesSection extends StatelessWidget {
  const ResultMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
              bottom: 8.0,
            ),
            child: Text(
              'Result Movies',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BlocBuilder<SearchMovieBloc, SearchMovieState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const ShimmerGrid(),
                loaded: (movies) {
                  if (movies.isEmpty) {
                    return const Column(
                      children: [
                        SizedBox(
                          height: 24.0,
                        ),
                        Center(
                          child: Text(
                            'No Results Found',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }

                  return MovieGrid(
                    movies: movies,
                    onTap: (movie) {
                      context.push('/dashboard/movie/${movie.id}');
                    },
                  );
                },
                error: (message) => Center(child: Text(message)),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }
}
