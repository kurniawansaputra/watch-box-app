part of 'get_now_playing_movies_bloc.dart';

@freezed
class GetNowPlayingMoviesState with _$GetNowPlayingMoviesState {
  const factory GetNowPlayingMoviesState.initial() = _Initial;
  const factory GetNowPlayingMoviesState.loading() = _Loading;
  const factory GetNowPlayingMoviesState.loaded(List<Movie> movies) = _Loaded;
  const factory GetNowPlayingMoviesState.error(String message) = _Error;
}
