import 'package:mivoe/mivoe.dart';

class NowPlayingEntity extends BaseEntity {
  final List<MovieItemEntity> nowPlayingList;

  NowPlayingEntity({
    List<MovieItemEntity>? nowPlayingList,
  }) : nowPlayingList = nowPlayingList ?? [];
}

class TopRatedEntity extends BaseEntity {
  final List<MovieItemEntity> topRatedList;

  TopRatedEntity({List<MovieItemEntity>? topRatedList})
      : topRatedList = topRatedList ?? [];
}

class PopularEntity extends BaseEntity {
  final List<MovieItemEntity> popularList;

  PopularEntity({List<MovieItemEntity>? popularList})
      : popularList = popularList ?? [];
}

class UpcomingEntity extends BaseEntity {
  final List<MovieItemEntity> upcomingList;

  UpcomingEntity({List<MovieItemEntity>? upcomingList})
      : upcomingList = upcomingList ?? [];
}

class MovieItemEntity extends BaseEntity {
  final String id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String synopsis;
  final double rating;

  MovieItemEntity({
    String? id,
    String? title,
    String? posterPath,
    String? releaseDate,
    String? synopsis,
    double? rating,
  })  : id = id ?? '',
        title = title ?? '',
        posterPath = posterPath ?? '',
        releaseDate = releaseDate ?? '',
        synopsis = synopsis ?? '',
        rating = rating ?? 0.0;
}
