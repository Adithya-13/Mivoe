import 'package:mivoe/mivoe.dart';

class DashboardRepository {
  final MivoeApi _mivoeApi;

  DashboardRepository({required MivoeApi mivoeApi}) : _mivoeApi = mivoeApi;

  Future<ApiResult<NowPlayingEntity>> getNowPlayingList() async {
    final response = await _mivoeApi.fetchNowPlaying();
    return DataMapper.mapNowPlayingEntity(response);
  }

  Future<ApiResult<TopRatedEntity>> getTopRatedList() async {
    final response = await _mivoeApi.fetchTopRated();
    return DataMapper.mapTopRatedEntity(response);
  }

  Future<ApiResult<PopularEntity>> getPopularList() async {
    final response = await _mivoeApi.fetchPopular();
    return DataMapper.mapPopularEntity(response);
  }

  Future<ApiResult<UpcomingEntity>> getUpcomingList() async {
    final response = await _mivoeApi.fetchUpcoming();
    return DataMapper.mapUpcomingEntity(response);
  }
}
