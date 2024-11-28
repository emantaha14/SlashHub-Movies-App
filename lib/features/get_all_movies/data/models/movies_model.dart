import 'package:slashhub_app/features/get_all_movies/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {
  MoviesModel({
    required double score,
    required ShowModel show,
  }) : super(score: score, show: show);

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        score: json["score"]?.toDouble(),
        show: ShowModel.fromJson(json["show"]),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "show": (show as ShowModel).toJson(),
      };
}

class ShowModel extends ShowEntity {
  ShowModel({
    required int id,
    required String url,
    required String name,
    required String type,
    required String language,
    required List<String> genres,
    required String status,
    required int? runtime,
    required int? averageRuntime,
    required DateTime? premiered,
    required DateTime? ended,
    required String? officialSite,
    required ScheduleModel schedule,
    required RatingModel rating,
    required int weight,
    required NetworkModel? network,
    required NetworkModel? webChannel,
    required String summary,
    required int updated,
  }) : super(
          id: id,
          url: url,
          name: name,
          type: type,
          language: language,
          genres: genres,
          status: status,
          runtime: runtime,
          averageRuntime: averageRuntime,
          premiered: premiered,
          ended: ended,
          officialSite: officialSite,
          schedule: schedule,
          rating: rating,
          weight: weight,
          network: network,
          webChannel: webChannel,
          summary: summary,
          updated: updated,
        );

  factory ShowModel.fromJson(Map<String, dynamic> json) => ShowModel(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"]),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: ScheduleModel.fromJson(json["schedule"]),
        rating: RatingModel.fromJson(json["rating"]),
        weight: json["weight"],
        network: json["network"] == null
            ? null
            : NetworkModel.fromJson(json["network"]),
        webChannel: json["webChannel"] == null
            ? null
            : NetworkModel.fromJson(json["webChannel"]),
        summary: json["summary"],
        updated: json["updated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": genres,
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered": premiered?.toIso8601String(),
        "ended": ended?.toIso8601String(),
        "officialSite": officialSite,
        "schedule": (schedule as ScheduleModel).toJson(),
        "rating": (rating as RatingModel).toJson(),
        "weight": weight,
        "summary": summary,
        "updated": updated,
      };
}

class ScheduleModel extends ScheduleEntity {
  ScheduleModel({
    required String time,
    required List<String> days,
  }) : super(time: time, days: days);

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        time: json["time"],
        days: List<String>.from(json["days"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "days": days,
      };
}

class RatingModel extends RatingEntity {
  RatingModel({required double? average}) : super(average: average);

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        average: json["average"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average,
      };
}

class NetworkModel extends NetworkEntity {
  NetworkModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
