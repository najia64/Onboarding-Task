import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/movie_data.dart';

part 'movies_datasource.g.dart';


@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("movie")
  Future<ResponseData> getMovies(@Query("api_key") String apiKey, @Query("sort_by") String sortBy);
}