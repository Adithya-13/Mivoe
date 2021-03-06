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

  static ApiResult<PopularEntity> mapPopularEntity(
      ApiResult<PopularResponse> response) {
    return response.when(
      success: (PopularResponse data) => ApiResult.success(
        PopularEntity(
          popularList: data.popularList
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

  static ApiResult<UpcomingEntity> mapUpcomingEntity(
      ApiResult<UpcomingResponse> response) {
    return response.when(
      success: (UpcomingResponse data) => ApiResult.success(
        UpcomingEntity(
          upcomingList: data.upcomingList
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

  static ApiResult<MovieDetailEntity> mapMovieDetailEntity(
      ApiResult<MovieDetailResponse> response) {
    return response.when(
      success: (MovieDetailResponse data) => ApiResult.success(
        MovieDetailEntity(
          id: data.id.toString(),
          title: data.title,
          posterPath: "https://image.tmdb.org/t/p/original${data.posterPath}",
          releaseDate: data.releaseDate,
          rating: data.voteAverage,
          synopsis: data.overview,
          budget: data.budget.toString(),
          duration: data.runtime.toString(),
          genres: data.genres?.map((e) => e.name!).toList(),
          popularity: data.popularity.toString(),
          revenue: data.revenue.toString(),
          tagline: data.tagline,
          voteAverage: data.voteAverage.toString(),
          voteCount: data.voteCount.toString(),
        ),
      ),
      failure: (error) => ApiResult.failure(error),
    );
  }

  static ApiResult<SearchEntity> mapSearchEntity(
      ApiResult<SearchResponse> response, String query) {
    return response.when(
      success: (SearchResponse data) => ApiResult.success(
        SearchEntity(
          searchList: data.results
              ?.map((item) => MovieItemEntity(
                    id: item.id.toString(),
                    title: item.title,
                    posterPath:
                        "https://image.tmdb.org/t/p/original${item.posterPath}",
                    releaseDate: item.releaseDate,
                    rating: item.voteAverage,
                    synopsis: item.overview,
                  ))
              .toList(),
              keyword: query,
              totalFound: data.totalResults
        ),
      ),
      failure: (error) => ApiResult.failure(error),
    );
  }
}
