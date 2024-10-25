import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/detail_movie/bloc/get_similr_movies/get_similar_movies_bloc.dart';
import 'package:movie_app/presentation/home/bloc/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:movie_app/presentation/home/bloc/search_movie/search_movie_bloc.dart';

import 'core/routes/router.dart';
import 'core/themes/theme.dart';
import 'core/themes/util.dart';
import 'data/datasources/movie_remote_datasource.dart';
import 'presentation/detail_movie/bloc/get_detail_movie/get_detail_movie_bloc.dart';
import 'presentation/home/bloc/get_now_playing_movies/get_now_playing_movies_bloc.dart';
import 'presentation/home/bloc/get_top_rated_movies/get_top_rated_movies_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNowPlayingMoviesBloc(
            MovieRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => GetPopularMoviesBloc(
            MovieRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => GetTopRatedMoviesBloc(
            MovieRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => GetDetailMovieBloc(
            MovieRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => GetSimilarMoviesBloc(
            MovieRemoteDatasource(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchMovieBloc(
            MovieRemoteDatasource(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: theme.dark(),
        routerConfig: router,
      ),
    );
  }
}
