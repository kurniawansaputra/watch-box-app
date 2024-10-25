part of 'get_detail_movie_bloc.dart';

@freezed
class GetDetailMovieState with _$GetDetailMovieState {
  const factory GetDetailMovieState.initial() = _Initial;
  const factory GetDetailMovieState.loading() = _Loading;
  const factory GetDetailMovieState.loaded(
      DetailMovieResponseModel detailMovie) = _Loaded;
  const factory GetDetailMovieState.error(String message) = _Error;
}
