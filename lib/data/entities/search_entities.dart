import 'package:mivoe/mivoe.dart';

class SearchEntity extends BaseEntity {
  final String keyword;
  final int totalFound;
  final List<MovieItemEntity> searchList;

  SearchEntity({
    String? keyword,
    int? totalFound,
    List<MovieItemEntity>? searchList,
  })  : keyword = keyword ?? '',
        totalFound = totalFound ?? 0,
        searchList = searchList ?? [];
}
