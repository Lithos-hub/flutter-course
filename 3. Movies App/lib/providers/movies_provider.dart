// Services
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:movies_app/env/env.dart';
import 'package:movies_app/helpers/debouncer.dart';

import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = Env.apiKey;
  final String _language = 'es-ES';
  final String _baseUrl = 'api.themoviedb.org';

  List<Movie> moviesData = [];
  List<Movie> popularMoviesData = [];
  Map<int, List<Cast>> movieCasting = {};

  int _page = 1;

  final debouncer = Debouncer(duration: Duration(milliseconds: 1000));

  final StreamController<List<Movie>> _resultsStreamController =
      new StreamController.broadcast();

  Stream<List<Movie>> get resultsStream => this._resultsStreamController.stream;

  MoviesProvider() {
    getMovies("now_playing");
    getMovies("popular");
  }

  _getJsonData({required String url, String? query}) async {
    final uri = Uri.https(
      _baseUrl,
      url,
      {
        'api_key': _apiKey.toString(),
        'language': _language,
        'page': _page.toString(),
        'query': query
      },
    );

    return await http.get(uri);
  }

  getMovies(String category) async {
    List<Movie> moviesDataResponse;
    List<Movie> popularResponse;

    try {
      final response = await _getJsonData(url: '/3/movie/$category');
      if (category == "now_playing") {
        moviesDataResponse =
            NowPlayingResponse.fromRawJson(response.body).results;
        moviesData = [...moviesData, ...moviesDataResponse];
      }
      if (category == "popular") {
        popularResponse = PopularResponse.fromRawJson(response.body).results;
        popularMoviesData = [...popularMoviesData, ...popularResponse];
      }
      notifyListeners(); // => Notify changes to widgets
      _page++;
    } catch (error) {
      return;
    }
  }

  Future<List<Movie>> searchMovies(String query) async {
    final response = await _getJsonData(url: '3/search/movie', query: query);
    return MovieByQueryResponse.fromRawJson(response.body).results;
  }

  void getResultsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovies(value);
      _resultsStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (Timer _) {
      debouncer.value = query;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((value) => timer.cancel());
  }

  Future<List<Cast>> getMovieCasting(int movieId) async {
    // To avoid request again (cache)
    if (movieCasting.containsKey(movieId)) return movieCasting[movieId]!;

    final response = await _getJsonData(url: '3/movie/$movieId/credits');

    final creditsResponse = CreditsResponse.fromRawJson(response.body);
    movieCasting[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
