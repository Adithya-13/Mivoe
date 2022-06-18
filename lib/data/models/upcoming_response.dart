class UpcomingResponse {
  List<UpcomingItem>? upcomingList;
  String? statusMessage;
  bool? success;
  int? statusCode;

  UpcomingResponse(
      {this.upcomingList, this.statusMessage, this.success, this.statusCode});

  UpcomingResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      upcomingList = <UpcomingItem>[];
      json['results'].forEach((v) {
        upcomingList!.add(UpcomingItem.fromJson(v));
      });
    }
    statusMessage = json['status_message'];
    success = json['success'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (upcomingList != null) {
      data['results'] = upcomingList!.map((v) => v.toJson()).toList();
    }
    data['status_message'] = statusMessage;
    data['success'] = success;
    data['status_code'] = statusCode;
    return data;
  }
}

class UpcomingItem {
  int? id;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;

  UpcomingItem(
      {this.id,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.voteAverage});

  UpcomingItem.fromJson(Map<String, dynamic> json) {
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
