part of 'get_top_rated_movies_bloc.dart';

@freezed
class GetTopRatedMoviesEvent with _$GetTopRatedMoviesEvent {
  const factory GetTopRatedMoviesEvent.started() = _Started;
  const factory GetTopRatedMoviesEvent.getTopRatedMovies() = _GetTopRatedMovies;
}
