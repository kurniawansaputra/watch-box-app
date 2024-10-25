part of 'get_detail_movie_bloc.dart';

@freezed
class GetDetailMovieEvent with _$GetDetailMovieEvent {
  const factory GetDetailMovieEvent.started() = _Started;
  const factory GetDetailMovieEvent.getDetailMovie(int movieId) =
      _GetDetailMovie;
}
