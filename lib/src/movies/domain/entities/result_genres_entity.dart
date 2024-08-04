import 'genre_entity.dart';

class ResultGenresEntity {
  List<GenreEntity> genres;

  ResultGenresEntity({
    required this.genres,
  });

  factory ResultGenresEntity.fromJson(Map<String, dynamic> json) => ResultGenresEntity(
        genres: List<GenreEntity>.from(json["genres"].map((x) => GenreEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
      };
}
