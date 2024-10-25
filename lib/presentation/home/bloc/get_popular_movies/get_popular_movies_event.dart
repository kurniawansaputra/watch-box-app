part of 'get_popular_movies_bloc.dart';

@freezed
class GetPopularMoviesEvent with _$GetPopularMoviesEvent {
  const factory GetPopularMoviesEvent.started() = _Started;
  const factory GetPopularMoviesEvent.getPopularMovies() = _GetPopularMovies;
}
