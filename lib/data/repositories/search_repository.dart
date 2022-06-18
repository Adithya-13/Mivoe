import 'package:mivoe/mivoe.dart';

class SearchRepository {
  Future<SearchEntity> getSearchList(String query) async {
    await Future.delayed(const Duration(seconds: 3));
    final SearchEntity entity = Dummy.getSearchList();
    return entity;
  }
}
