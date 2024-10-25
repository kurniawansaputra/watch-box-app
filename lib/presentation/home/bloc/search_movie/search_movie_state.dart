part of 'search_movie_bloc.dart';

@freezed
class SearchMovieState with _$SearchMovieState {
  const factory SearchMovieState.initial() = _Initial;
  const factory SearchMovieState.loading() = _Loading;
  const factory SearchMovieState.loaded(List<Movie> movies) = _Loaded;
  const factory SearchMovieState.error(String message) = _Error;
}
