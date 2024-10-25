part of 'get_popular_movies_bloc.dart';

@freezed
class GetPopularMoviesState with _$GetPopularMoviesState {
  const factory GetPopularMoviesState.initial() = _Initial;
  const factory GetPopularMoviesState.loading() = _Loading;
  const factory GetPopularMoviesState.loaded(List<Movie> movies) = _Loaded;
  const factory GetPopularMoviesState.error(String message) = _Error;
}
