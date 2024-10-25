import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/movie_remote_datasource.dart';
import '../../../../data/models/response/movie_response_model.dart';

part 'search_movie_event.dart';
part 'search_movie_state.dart';
part 'search_movie_bloc.freezed.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final MovieRemoteDatasource movieRemoteDatasource;
  SearchMovieBloc(this.movieRemoteDatasource) : super(const _Initial()) {
    on<_Search>((event, emit) async {
      emit(const _Loading());
      final result = await movieRemoteDatasource.searchMovie(event.query);
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Loaded(r.results ?? [])),
      );
    });
  }
}
