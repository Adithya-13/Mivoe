class NowPlayingResponse {
  List<NowPlayingItem>? nowPlayingList;
  String? statusMessage;
  bool? success;
  int? statusCode;

  NowPlayingResponse(
      {this.nowPlayingList, this.statusMessage, this.success, this.statusCode});

  NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      nowPlayingList = <NowPlayingItem>[];
      json['results'].forEach((v) {
        nowPlayingList!.add(NowPlayingItem.fromJson(v));
      });
    }
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nowPlayingList != null) {
      data['results'] = nowPlayingList!.map((v) => v.toJson()).toList();
    }
    data['status_message'] = statusMessage;
    data['success'] = success;
    data['status_code'] = statusCode;
    return data;
  }
}

class NowPlayingItem {
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  NowPlayingItem(
      {this.id,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage});

  NowPlayingItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}
