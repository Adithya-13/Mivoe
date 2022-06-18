class PopularResponse {
  List<PopularItem>? popularList;
  String? statusMessage;
  bool? success;
  int? statusCode;

  PopularResponse(
      {this.popularList, this.statusMessage, this.success, this.statusCode});

  PopularResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      popularList = <PopularItem>[];
      json['results'].forEach((v) {
        popularList!.add(PopularItem.fromJson(v));
      });
    }
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (popularList != null) {
      data['results'] = popularList!.map((v) => v.toJson()).toList();
    }
    data['status_message'] = statusMessage;
    data['success'] = success;
    data['status_code'] = statusCode;
    return data;
  }
}

class PopularItem {
  int? id;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  PopularItem(
      {this.id,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage});

  PopularItem.fromJson(Map<String, dynamic> json) {
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
