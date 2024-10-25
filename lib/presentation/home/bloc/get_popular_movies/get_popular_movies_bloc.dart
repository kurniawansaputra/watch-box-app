import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/movie_remote_datasource.dart';
import '../../../../data/models/response/movie_response_model.dart';

part 'get_popular_movies_event.dart';
part 'get_popular_movies_state.dart';
part 'get_popular_movies_bloc.freezed.dart';

class GetPopularMoviesBloc
    extends Bloc<GetPopularMoviesEvent, GetPopularMoviesState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  GetPopularMoviesBloc(this.movieRemoteDatasource) : super(const _Initial()) {
    on<_GetPopularMovies>((event, emit) async {
      emit(const _Loading());
      final result = await movieRemoteDatasource.getPopularMovies();
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.results ?? [])),
      );
    });
  }
}
