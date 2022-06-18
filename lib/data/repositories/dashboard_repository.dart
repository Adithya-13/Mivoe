import 'package:mivoe/mivoe.dart';

class DashboardRepository {
  Future<NowPlayingEntity> getNowPlayingList() async {
    await Future.delayed(const Duration(seconds: 3));
    final NowPlayingEntity entity = Dummy.getNowPlayingList();
    return entity;
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
