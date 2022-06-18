import 'package:mivoe/mivoe.dart';

class DataMapper {
  static ApiResult<NowPlayingEntity> mapNowPlayingEntity(
      ApiResult<NowPlayingResponse> response) {
    return response.when(
      success: (NowPlayingResponse data) => ApiResult.success(
        NowPlayingEntity(
          nowPlayingList: data.nowPlayingList
              ?.map((item) => MovieItemEntity(
                    id: item.id.toString(),
                    title: item.title,
                    posterPath:
                        "https://image.tmdb.org/t/p/original${item.posterPath}",
                    releaseDate: item.releaseDate,
                    synopsis: item.overview,
                    rating: item.voteAverage,
                  ))
              .toList(),
        ),
      ),
      failure: (error) => ApiResult.failure(error),
    );
  }

  static ApiResult<TopRatedEntity> mapTopRatedEntity(
      ApiResult<TopRatedResponse> response) {
    return response.when(
      success: (TopRatedResponse data) => ApiResult.success(
        TopRatedEntity(
          topRatedList: data.topRatedList
              ?.map((item) => MovieItemEntity(
                    id: item.id.toString(),
                    title: item.title,
                    posterPath:
                        "https://image.tmdb.org/t/p/original${item.posterPath}",
                    releaseDate: item.releaseDate,
                    rating: item.voteAverage,
                  ))
              .toList(),
        ),
      ),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
