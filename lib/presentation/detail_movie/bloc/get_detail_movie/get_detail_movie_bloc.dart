import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/data/models/response/detail_movie_response_model.dart';

import '../../../../data/datasources/movie_remote_datasource.dart';

part 'get_detail_movie_event.dart';
part 'get_detail_movie_state.dart';
part 'get_detail_movie_bloc.freezed.dart';

class GetDetailMovieBloc
    extends Bloc<GetDetailMovieEvent, GetDetailMovieState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  GetDetailMovieBloc(this.movieRemoteDatasource) : super(const _Initial()) {
    on<_GetDetailMovie>((event, emit) async {
      emit(const _Loading());
      final result =
          await movieRemoteDatasource.getDetailMovie(event.movieId.toString());
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r)),
      );
    });
  }
}
