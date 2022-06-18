import 'package:mivoe/mivoe.dart';

class MovieDetailEntity extends BaseEntity {
  final String id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final double rating;
  final String synopsis;
  final String duration;
  final String tagline;
  final String budget;
  final String revenue;
  final String popularity;
  final String voteAverage;
  final String voteCount;
  final List<String> genres;

  MovieDetailEntity({
    String? id,
    String? title,
    String? posterPath,
    String? releaseDate,
    double? rating,
    String? synopsis,
    String? duration,
    String? tagline,
    String? budget,
    String? revenue,
    String? popularity,
    String? voteAverage,
    String? voteCount,
    List<String>? genres,
  })  : id = id ?? '',
        title = title ?? '',
        posterPath = posterPath ?? '',
        releaseDate = releaseDate ?? '',
        rating = rating ?? 0.0,
        synopsis = synopsis ?? '',
        duration = duration ?? '',
        tagline = tagline ?? '',
        budget = budget ?? '',
        revenue = revenue ?? '',
        popularity = popularity ?? '',
        voteAverage = voteAverage ?? '',
        voteCount = voteCount ?? '',
        genres = genres ?? [];
}
