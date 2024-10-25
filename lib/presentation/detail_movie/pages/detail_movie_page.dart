import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/data/models/response/detail_movie_response_model.dart';
import 'package:movie_app/presentation/detail_movie/bloc/get_detail_movie/get_detail_movie_bloc.dart';
import 'package:movie_app/presentation/detail_movie/bloc/get_similr_movies/get_similar_movies_bloc.dart';
import 'package:movie_app/presentation/detail_movie/widgets/option_section.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/components/category_list_section.dart';

class DetailMoviePage extends StatefulWidget {
  final String movieId;
  const DetailMoviePage({super.key, required this.movieId});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  void initState() {
    super.initState();
    final detailMovie = context.read<GetDetailMovieBloc>();
    final similarMovies = context.read<GetSimilarMoviesBloc>();

    try {
      if (widget.movieId.isNotEmpty) {
        int movieId = int.parse(widget.movieId);
        detailMovie.add(GetDetailMovieEvent.getDetailMovie(movieId));
        similarMovies.add(GetSimilarMoviesEvent.getSimilarMovies(movieId));
      } else {
        log("Error: movieId is null or empty.");
      }
    } catch (e) {
      log("Error parsing movieId: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocBuilder<GetDetailMovieBloc, GetDetailMovieState>(
        builder: (context, state) {
          return state.when(
            loading: () => _loadingDetailMovie(),
            loaded: (detailMovie) => _buildDetailMovie(context, detailMovie),
            error: (message) => Center(child: Text(message)),
            initial: () {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }

  Widget _loadingDetailMovie() {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[700]!,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  height: 185.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 40.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      height: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailMovie(
      BuildContext context, DetailMovieResponseModel movie) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 195.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    movie.title ?? 'No Title',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.releaseDate != null
                          ? movie.releaseDate!.year.toString()
                          : 'No Release Year',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.circle,
                      size: 4.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '${movie.runtime} min',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Icon(
                      Icons.circle,
                      size: 4.0,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      movie.spokenLanguages != null &&
                              movie.spokenLanguages!.isNotEmpty
                          ? '${movie.spokenLanguages!.length} Language${movie.spokenLanguages!.length > 1 ? 's' : ''}'
                          : 'No Language',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FilledButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_circle,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Subscribe to Watch'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 4.0,
                  runSpacing: -8.0,
                  children: movie.genres != null && movie.genres!.isNotEmpty
                      ? movie.genres!.map((e) {
                          return Chip(
                            label: Text(
                              e.name ?? 'Unknown',
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          );
                        }).toList()
                      : [
                          const Chip(
                            label: Text('No Genre'),
                          ),
                        ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  movie.overview ?? 'No Overview',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const OptionSection(),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  'More Like This',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<GetSimilarMoviesBloc, GetSimilarMoviesState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SizedBox.shrink(),
                loaded: (movies) {
                  return CategoryListSection(
                    categoryTitle: 'Popular Movies',
                    movies: movies,
                  );
                },
                error: (message) => Center(
                  child: Text(message),
                ),
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
