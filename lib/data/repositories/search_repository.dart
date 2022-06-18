import 'package:mivoe/mivoe.dart';

class SearchRepository {
  final MivoeApi _mivoeApi;

  SearchRepository({required MivoeApi mivoeApi}) : _mivoeApi = mivoeApi;

  Future<ApiResult<SearchEntity>> getSearchList(String query) async {
    final response = await _mivoeApi.fetchSearchMovies(query);
    return DataMapper.mapSearchEntity(response, query);
  }
}
