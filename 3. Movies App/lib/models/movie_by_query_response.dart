// To parse this JSON data, do
//
//     final movieByQuery = movieByQueryFromJson(jsonString);

import 'dart:convert';

import 'package:movies_app/models/models.dart';

MovieByQueryResponse movieByQueryFromJson(String str) =>
    MovieByQueryResponse.fromJson(json.decode(str));

class MovieByQueryResponse {
  MovieByQueryResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory MovieByQueryResponse.fromRawJson(String str) =>
      MovieByQueryResponse.fromJson(json.decode(str));

  factory MovieByQueryResponse.fromJson(Map<String, dynamic> json) =>
      MovieByQueryResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
