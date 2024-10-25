import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/get_now_playing_movies/get_now_playing_movies_bloc.dart';
import 'movie_grid.dart';
import 'shimmer_grid.dart';

class NowPlayingMoviesSection extends StatelessWidget {
  const NowPlayingMoviesSection({super.key});

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
              'Trending In',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BlocBuilder<GetNowPlayingMoviesBloc, GetNowPlayingMoviesState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const ShimmerGrid(),
                loaded: (movies) => MovieGrid(
                  movies: movies,
                  onTap: (movie) {
                    context.push('/dashboard/movie/${movie.id}');
                  },
                ),
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
