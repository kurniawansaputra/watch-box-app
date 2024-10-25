import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/constans/variables.dart';
import 'package:movie_app/data/models/response/detail_movie_response_model.dart';
import 'package:movie_app/data/models/response/movie_response_model.dart';

class MovieRemoteDatasource {
  Future<Either<String, MovieResponseModel>> _getMovies(String category) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/3/movie/$category');
      final header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Variables.apiKey}',
      };

      final response = await http.get(
        url,
        headers: header,
      );

      if (response.statusCode == 200) {
        if (category == 'popular') {
          log('Popular Movies: ${response.body}');
        }
        return Right(MovieResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, MovieResponseModel>> getNowPlayingMovies() async {
    return await _getMovies('now_playing');
  }

  Future<Either<String, MovieResponseModel>> getPopularMovies() async {
    return await _getMovies('popular');
  }

  Future<Either<String, MovieResponseModel>> getTopRatedMovies() async {
    return await _getMovies('top_rated');
  }

  Future<Either<String, DetailMovieResponseModel>> getDetailMovie(
      String movieId) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/3/movie/$movieId');
      final header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Variables.apiKey}',
      };

      final response = await http.get(
        url,
        headers: header,
      );

      if (response.statusCode == 200) {
        log('Detail Movie: ${response.body}');
        return Right(DetailMovieResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, MovieResponseModel>> getSimilarMovies(
      String movieId) async {
    try {
      final url = Uri.parse('${Variables.baseUrl}/3/movie/$movieId/similar');
      final header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Variables.apiKey}',
      };

      final response = await http.get(
        url,
        headers: header,
      );

      if (response.statusCode == 200) {
        return Right(MovieResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }

  Future<Either<String, MovieResponseModel>> searchMovie(String query) async {
    try {
      final encodedQuery = Uri.encodeQueryComponent(query);
      final url =
          Uri.parse('${Variables.baseUrl}/3/search/movie?query=$encodedQuery');
      final header = {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${Variables.apiKey}',
      };

      final response = await http.get(url, headers: header);

      if (response.statusCode == 200) {
        log('Search Movie: ${response.body}');
        return Right(MovieResponseModel.fromJson(response.body));
      } else {
        return Left(response.body);
      }
    } catch (e) {
      return Left('Exception: $e');
    }
  }
}
