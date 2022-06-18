import 'package:flutter/material.dart';
import 'package:mivoe/mivoe.dart';

class MivoeApi {
  DioClient dioClient;

  MivoeApi({required this.dioClient});

  Future<ApiResult<NowPlayingResponse>> fetchNowPlaying() async {
    try {
      final response = await dioClient.get('/movie/now_playing');
      return ApiResult.success(NowPlayingResponse.fromJson(response));
    } catch (e, stacktrace) {
      print('Exception occured: $e stackTrace: $stacktrace');
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }
}
