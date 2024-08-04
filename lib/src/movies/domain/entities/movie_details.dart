class MovieDetailsEntity {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompany>? productionCompanies;
  List<ProductionCountry>? productionCountries;
  DateTime? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsEntity({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailsEntity.empty() => MovieDetailsEntity(
        adult: false,
        backdropPath: "",
        belongsToCollection: BelongsToCollection.empty(),
        budget: 0,
        genres: <Genre>[],
        homepage: "",
        id: 0,
        imdbId: "",
        originCountry: <String>[],
        originalLanguage: "",
        originalTitle: "",
        overview: "",
        popularity: 0.0,
        posterPath: "",
        productionCompanies: <ProductionCompany>[],
        productionCountries: <ProductionCountry>[],
        releaseDate: DateTime.now(),
        revenue: 0,
        runtime: 0,
        spokenLanguages: <SpokenLanguage>[],
        status: "",
        tagline: "",
        title: "",
        video: false,
        voteAverage: 0.0,
        voteCount: 0,
      );

  factory MovieDetailsEntity.fromJson(Map<String, dynamic> json) => MovieDetailsEntity(
        adult: json["adult"] ?? "",
        backdropPath: json["backdrop_path"],
        belongsToCollection: BelongsToCollection.fromJson(json["belongs_to_collection"] ?? {}),
        budget: json["budget"] ?? 0,
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)) ?? []),
        homepage: json["homepage"] ?? "",
        id: json["id"] ?? 0,
        imdbId: json["imdb_id"] ?? "",
        originCountry: List<String>.from(json["origin_country"].map((x) => x) ?? []),
        originalLanguage: json["original_language"] ?? "",
        originalTitle: json["original_title"] ?? "",
        overview: json["overview"] ?? "",
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"] ?? "",
        productionCompanies: List<ProductionCompany>.from(
            json["production_companies"].map((x) => ProductionCompany.fromJson(x)) ?? []),
        productionCountries: List<ProductionCountry>.from(
            json["production_countries"].map((x) => ProductionCountry.fromJson(x)) ?? []),
        releaseDate: DateTime.parse(json["release_date"] ?? DateTime.now()),
        revenue: json["revenue"] ?? 0,
        runtime: json["runtime"] ?? 0,
        spokenLanguages: List<SpokenLanguage>.from(
            json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x)) ?? []),
        status: json["status"] ?? "",
        tagline: json["tagline"] ?? "",
        title: json["title"] ?? "",
        video: json["video"] ?? false,
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );
}

class BelongsToCollection {
  int? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  factory BelongsToCollection.empty() => BelongsToCollection(
        id: 0,
        name: "",
        posterPath: "",
        backdropPath: "",
      );

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) => BelongsToCollection(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        posterPath: json["poster_path"] ?? "",
        backdropPath: json["backdrop_path"] ?? "",
      );
}

class Genre {
  int? id;
  String? name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );
}

class ProductionCompany {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"] ?? 0,
        logoPath: json["logo_path"] ?? "",
        name: json["name"] ?? "",
        originCountry: json["origin_country"] ?? "",
      );
}

class ProductionCountry {
  String? iso31661;
  String? name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"] ?? "",
        name: json["name"] ?? "",
      );
}

class SpokenLanguage {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"] ?? "",
        iso6391: json["iso_639_1"] ?? "",
        name: json["name"] ?? "",
      );
}
