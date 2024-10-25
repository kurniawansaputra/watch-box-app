part of 'get_similar_movies_bloc.dart';

@freezed
class GetSimilarMoviesState with _$GetSimilarMoviesState {
  const factory GetSimilarMoviesState.initial() = _Initial;
  const factory GetSimilarMoviesState.loading() = _Loading;
  const factory GetSimilarMoviesState.loaded(List<Movie> movies) = _Loaded;
  const factory GetSimilarMoviesState.error(String message) = _Error;
}
