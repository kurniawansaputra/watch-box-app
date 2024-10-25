import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

class MovieResponseModel {
  final int? page;
  final List<Movie>? results;
  final int? totalPages;
  final int? totalResults;

  MovieResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieResponseModel.fromJson(String str) =>
      MovieResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Movie>.from(json["results"]!.map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Movie {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) {
    String? releaseDateString = json["release_date"];

    if (releaseDateString == null || releaseDateString.isEmpty) {
      return Movie(
        releaseDate: null,
      );
    }

    DateTime? releaseDate;

    try {
      releaseDate = DateTime.parse(releaseDateString);
    } catch (e) {
      try {
        releaseDate = DateFormat('yyyy-MM-dd').parse(releaseDateString);
      } catch (e) {
        log('Error parsing date: $e');
        throw FormatException(
            'Invalid date format for release_date: $releaseDateString');
      }
    }

    return Movie(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"]?.toDouble(),
      posterPath: json["poster_path"],
      releaseDate: releaseDate,
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
    );
  }

  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate != null
            ? "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}"
            : null,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
