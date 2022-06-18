class TopRatedResponse {
  List<TopRatedItem>? topRatedList;
  String? statusMessage;
  bool? success;
  int? statusCode;

  TopRatedResponse(
      {this.topRatedList, this.statusMessage, this.success, this.statusCode});

  TopRatedResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      topRatedList = <TopRatedItem>[];
      json['results'].forEach((v) {
        topRatedList!.add(TopRatedItem.fromJson(v));
      });
    }
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topRatedList != null) {
      data['results'] = topRatedList!.map((v) => v.toJson()).toList();
    }
    data['status_message'] = statusMessage;
    data['success'] = success;
    data['status_code'] = statusCode;
    return data;
  }
}

class TopRatedItem {
  int? id;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  TopRatedItem(
      {this.id,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage});

  TopRatedItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    return data;
  }
}
