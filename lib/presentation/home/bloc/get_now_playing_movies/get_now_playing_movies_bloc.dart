import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/data/models/response/movie_response_model.dart';

import '../../../../data/datasources/movie_remote_datasource.dart';

part 'get_now_playing_movies_event.dart';
part 'get_now_playing_movies_state.dart';
part 'get_now_playing_movies_bloc.freezed.dart';

class GetNowPlayingMoviesBloc
    extends Bloc<GetNowPlayingMoviesEvent, GetNowPlayingMoviesState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  GetNowPlayingMoviesBloc(this.movieRemoteDatasource)
      : super(const _Initial()) {
    on<_GetNowPlayingMovies>((event, emit) async {
      emit(const _Loading());
      final result = await movieRemoteDatasource.getNowPlayingMovies();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.results ?? [])),
      );
    });
  }
}
