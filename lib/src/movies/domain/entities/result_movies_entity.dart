import 'movie_entity.dart';

class ResultMoviesEntity {
  int page;
  List<MovieEntity> results;
  int totalPages;
  int totalResults;

  ResultMoviesEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ResultMoviesEntity.fromJson(Map<String, dynamic> json) => ResultMoviesEntity(
        page: json["page"],
        results: List<MovieEntity>.from(json["results"].map((x) => MovieEntity.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
