class MoviesModel extends MoviesEntity {
  MoviesModel({
    required double score,
    required Show show,
  }) : super(score: score, show: show);

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
    score: json["score"]?.toDouble() ?? 0,
    show: Show.fromJson(json["show"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "show": show.toJson(),
  };
}

class Show extends ShowEntity {
  Show({
    required int id,
    required String name,
    ImageModel? image,
    required String summary,
    required String language,
    required List<String> genres,
    required int runtime,
    required String premiered,
  }) : super(
    id: id,
    name: name,
    image: image,
    summary: summary,
    language: language,
    genres: genres,
    runtime: runtime,
    premiered: premiered,
  );

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      image: json["image"] != null ? ImageModel.fromJson(json["image"]) : null,
      summary: json["summary"] ?? 'No summary available.',
      language: json["language"] ?? '',
      genres: List<String>.from(json["genres"]?.map((x) => x) ?? []),
      runtime: json["runtime"] ?? 0,
      premiered: json["premiered"] != null && json["premiered"] != ""
          ? json["premiered"]
          : "No premiere date available",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image?.toJson(),
    "summary": summary,
    "language": language,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "runtime": runtime ?? 0,
    "premiered": premiered,
  };
}

class ImageModel {
  String medium;
  String original;

  ImageModel({
    required this.medium,
    required this.original,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    medium: json["medium"] ?? '',
    original: json["original"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "original": original,
  };
}

class MoviesEntity {
  double score;
  ShowEntity show;

  MoviesEntity({
    required this.score,
    required this.show,
  });
}

class ShowEntity {
  int id;
  String name;
  ImageModel? image;
  String summary;
  String language;
  List<String> genres;
  int runtime;
  String premiered;

  ShowEntity({
    required this.id,
    required this.name,
    this.image,
    required this.summary,
    required this.language,
    required this.genres,
    required this.runtime,
    required this.premiered,
  });

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image?.toJson(),
    "summary": summary,
    "language": language,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "runtime": runtime ?? 0,
    "premiered": premiered,
  };
}

class ImageEntity {
  String medium;
  String original;

  ImageEntity({
    required this.medium,
    required this.original,
  });
}
