import 'package:mivoe/mivoe.dart';

class DashboardRepository {
  final MivoeApi _mivoeApi;

  DashboardRepository({required MivoeApi mivoeApi}) : _mivoeApi = mivoeApi;

  Future<ApiResult<NowPlayingEntity>> getNowPlayingList() async {
    final response = await _mivoeApi.fetchNowPlaying();
    return DataMapper.mapNowPlayingEntity(response);
  }

  Future<TopRatedEntity> getTopRatedList() async {
    await Future.delayed(const Duration(seconds: 3));
    final TopRatedEntity entity = Dummy.getTopRatedList();
    return entity;
  }

  Future<PopularEntity> getPopularList() async {
    await Future.delayed(const Duration(seconds: 3));
    final PopularEntity entity = Dummy.getPopularList();
    return entity;
  }

  Future<UpcomingEntity> getUpcomingList() async {
    await Future.delayed(const Duration(seconds: 3));
    final UpcomingEntity entity = Dummy.getUpcomingList();
    return entity;
  }
}
