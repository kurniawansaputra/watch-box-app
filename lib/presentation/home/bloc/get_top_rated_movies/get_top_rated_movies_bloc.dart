import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/movie_remote_datasource.dart';
import '../../../../data/models/response/movie_response_model.dart';

part 'get_top_rated_movies_event.dart';
part 'get_top_rated_movies_state.dart';
part 'get_top_rated_movies_bloc.freezed.dart';

class GetTopRatedMoviesBloc
    extends Bloc<GetTopRatedMoviesEvent, GetTopRatedMoviesState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  GetTopRatedMoviesBloc(this.movieRemoteDatasource) : super(const _Initial()) {
    on<_GetTopRatedMovies>((event, emit) async {
      emit(const _Loading());
      final result = await movieRemoteDatasource.getTopRatedMovies();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.results ?? [])),
      );
    });
  }
}
