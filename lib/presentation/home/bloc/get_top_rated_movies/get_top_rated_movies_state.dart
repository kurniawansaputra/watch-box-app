part of 'get_top_rated_movies_bloc.dart';

@freezed
class GetTopRatedMoviesState with _$GetTopRatedMoviesState {
  const factory GetTopRatedMoviesState.initial() = _Initial;
  const factory GetTopRatedMoviesState.loading() = _Loading;
  const factory GetTopRatedMoviesState.loaded(List<Movie> movies) = _Loaded;
  const factory GetTopRatedMoviesState.error(String message) = _Error;
}
