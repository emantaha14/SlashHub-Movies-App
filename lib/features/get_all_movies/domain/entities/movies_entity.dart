class MoviesEntity {
  final double score;
  final ShowEntity show;

  MoviesEntity({
    required this.score,
    required this.show,
  });
}

class ShowEntity {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final DateTime? premiered;
  final DateTime? ended;
  final String? officialSite;
  final ScheduleEntity schedule;
  final RatingEntity rating;
  final int weight;
  final NetworkEntity? network;
  final NetworkEntity? webChannel;
  final String summary;
  final int updated;

  ShowEntity({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.summary,
    required this.updated,
  });
}

class ScheduleEntity {
  final String time;
  final List<String> days;

  ScheduleEntity({
    required this.time,
    required this.days,
  });
}

class RatingEntity {
  final double? average;

  RatingEntity({
    required this.average,
  });
}

class NetworkEntity {
  final int id;
  final String name;

  NetworkEntity({
    required this.id,
    required this.name,
  });
}
