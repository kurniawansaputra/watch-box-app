part of 'get_similar_movies_bloc.dart';

@freezed
class GetSimilarMoviesEvent with _$GetSimilarMoviesEvent {
  const factory GetSimilarMoviesEvent.started() = _Started;
  const factory GetSimilarMoviesEvent.getSimilarMovies(int movieId) =
      _GetSimilarMovies;
}
