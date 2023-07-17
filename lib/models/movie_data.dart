import 'package:json_annotation/json_annotation.dart';

part 'movie_data.g.dart';

@JsonSerializable()
class MovieModel {
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  String title;

  MovieModel({
    required this.overview,
    required this.posterPath,
    required this.title,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

@JsonSerializable()
class ResponseData {
  int page;
  List<MovieModel> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  ResponseData({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}