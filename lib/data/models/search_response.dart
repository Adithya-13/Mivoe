class SearchResponse {
  List<SearchItem>? results;
  int? totalResults;

  SearchResponse({this.results, this.totalResults});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <SearchItem>[];
      json['results'].forEach((v) {
        results!.add(SearchItem.fromJson(v));
      });
    }
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = totalResults;
    return data;
  }
}

class SearchItem {
  String? posterPath;
  String? overview;
  String? releaseDate;
  int? id;
  String? title;
  String? backdropPath;
  double? voteAverage;

  SearchItem(
      {this.posterPath,
      this.overview,
      this.releaseDate,
      this.id,
      this.title,
      this.backdropPath,
      this.voteAverage});

  SearchItem.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    id = json['id'];
    title = json['title'];
    backdropPath = json['backdrop_path'];
    voteAverage = json['vote_average'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['poster_path'] = posterPath;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['id'] = id;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['vote_average'] = voteAverage;
    return data;
  }
}
