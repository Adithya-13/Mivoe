import 'package:mivoe/mivoe.dart';

class DetailRepository {
  final MivoeApi _mivoeApi;

  DetailRepository({required MivoeApi mivoeApi}) : _mivoeApi = mivoeApi;

  Future<ApiResult<MovieDetailEntity>> getMovieDetail(String id) async {
    final response = await _mivoeApi.fetchDetailMovie(id);
    return DataMapper.mapMovieDetailEntity(response);
  }
}
