import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/home/bloc/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:movie_app/presentation/home/widgets/image_carousal_section.dart';
import 'package:movie_app/presentation/home/widgets/major_film_studios_section.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/get_now_playing_movies/get_now_playing_movies_bloc.dart';
import '../bloc/get_top_rated_movies/get_top_rated_movies_bloc.dart';
import '../../../core/components/category_list_section.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> imgList = [];

  @override
  void initState() {
    super.initState();

    final nowPlayingMoviesBloc = context.read<GetNowPlayingMoviesBloc>();
    final popularMovies = context.read<GetPopularMoviesBloc>();
    final topRatedMoviesBloc = context.read<GetTopRatedMoviesBloc>();

    nowPlayingMoviesBloc
        .add(const GetNowPlayingMoviesEvent.getNowPlayingMovies());
    popularMovies.add(const GetPopularMoviesEvent.getPopularMovies());
    topRatedMoviesBloc.add(const GetTopRatedMoviesEvent.getTopRatedMovies());
  }

  Widget _loadingImageCarousal() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        height: 206.0,
        color: Colors.white,
      ),
    );
  }

  Widget _loadingCategoryList() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[700]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Container(
                        width: 120.0,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 28.0,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.cast_rounded,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24.0,
              ),
              BlocBuilder<GetNowPlayingMoviesBloc, GetNowPlayingMoviesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => _loadingImageCarousal(),
                    loaded: (movies) {
                      final imgList = movies
                          .map((movie) {
                            final backdropPath = movie.backdropPath;
                            if (backdropPath != null &&
                                backdropPath.isNotEmpty) {
                              return 'https://image.tmdb.org/t/p/w500$backdropPath';
                            } else {
                              return null;
                            }
                          })
                          .whereType<String>()
                          .take(5)
                          .toList();

                      final titles = movies
                          .map((movie) => movie.title)
                          .whereType<String>()
                          .take(5)
                          .toList();

                      final movieIds = movies
                          .map((movie) => movie.id.toString())
                          .take(5)
                          .toList();

                      return ImageCarouselSection(
                        imgList: imgList,
                        titles: titles,
                        movieIds: movieIds,
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
              const MajorFilmStudiosSection(),
              const SizedBox(
                height: 24.0,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Popular Movies',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              BlocBuilder<GetPopularMoviesBloc, GetPopularMoviesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => _loadingCategoryList(),
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
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  'Recommended For You',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              BlocBuilder<GetTopRatedMoviesBloc, GetTopRatedMoviesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => _loadingCategoryList(),
                    loaded: (movies) {
                      return CategoryListSection(
                        categoryTitle: 'Recomended For You',
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
        ),
      ),
    );
  }
}
