import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/data/datasources/movie_remote_datasource.dart';

import '../../../../data/models/response/movie_response_model.dart';

part 'get_similar_movies_event.dart';
part 'get_similar_movies_state.dart';
part 'get_similar_movies_bloc.freezed.dart';

class GetSimilarMoviesBloc
    extends Bloc<GetSimilarMoviesEvent, GetSimilarMoviesState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  GetSimilarMoviesBloc(this.movieRemoteDatasource) : super(const _Initial()) {
    on<_GetSimilarMovies>(
      (event, emit) async {
        emit(const _Loading());
        final result = await movieRemoteDatasource
            .getSimilarMovies(event.movieId.toString());
        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r.results ?? [])),
        );
      },
    );
  }
}
