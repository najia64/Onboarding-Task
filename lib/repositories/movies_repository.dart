import 'package:dio/dio.dart';

import '../datasources/movies_datasource.dart';
import '../models/movie_data.dart';

final dio = Dio()..options.headers = {
    "accept": "application/json",
    "content-type": "application/json",
}; 

class MovieRepository{
  final ApiClient _apiClient;

  MovieRepository() : _apiClient = ApiClient(dio, baseUrl: "http://api.themoviedb.org/3/discover/" );

  Future<List<MovieModel>> getMovies() async {
    String apiKey = "e882a7fb5e09d9f1d8c7e48c92154ba4";
    String sortBy = "popularity.desc";
    try {
      final responseData = await _apiClient.getMovies(apiKey, sortBy);
      return responseData.results;
    } catch (e) {
      // Handle the error here
      throw Exception('Failed to fetch movies: $e');
    }
  }
}