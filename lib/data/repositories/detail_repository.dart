import 'package:mivoe/mivoe.dart';

class DetailRepository {
  Future<MovieDetailEntity> getMovieDetail(String id) async {
    await Future.delayed(const Duration(seconds: 3));
    final MovieDetailEntity entity = Dummy.getMovieDetail();
    return entity;
  }
}
