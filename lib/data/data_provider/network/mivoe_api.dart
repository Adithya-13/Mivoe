import 'package:mivoe/mivoe.dart';

class MivoeApi {
  DioClient dioClient;

  MivoeApi({required this.dioClient});

  Future<ApiResult<NowPlayingResponse>> fetchNowPlaying() async {
    try {
      final response = await dioClient.get('/movie/now_playing');
      return ApiResult.success(NowPlayingResponse.fromJson(response));
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<TopRatedResponse>> fetchTopRated() async {
    try {
      final response = await dioClient.get('/movie/top_rated');
      return ApiResult.success(TopRatedResponse.fromJson(response));
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<PopularResponse>> fetchPopular() async {
    try {
      final response = await dioClient.get('/movie/popular');
      return ApiResult.success(PopularResponse.fromJson(response));
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<UpcomingResponse>> fetchUpcoming() async {
    try {
      final response = await dioClient.get('/movie/upcoming');
      return ApiResult.success(UpcomingResponse.fromJson(response));
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<MovieDetailResponse>> fetchDetailMovie(
      String movieId) async {
    try {
      final response = await dioClient.get('/movie/$movieId');
      return ApiResult.success(MovieDetailResponse.fromJson(response));
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<SearchResponse>> fetchSearchMovies(String query) async {
    try {
      final response = await dioClient.get('/search/movie', queryParameters: {
        'query': query,
      });
      return ApiResult.success(SearchResponse.fromJson(response));
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
