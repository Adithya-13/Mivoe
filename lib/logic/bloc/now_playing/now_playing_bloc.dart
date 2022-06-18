import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mivoe/mivoe.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final DashboardRepository dashboardRepository;
  NowPlayingBloc({required this.dashboardRepository})
      : super(NowPlayingInitial()) {
    on<NowPlayingFetched>((event, emit) async {
      emit(NowPlayingLoading());
      try {
        final NowPlayingEntity entity =
            await dashboardRepository.getNowPlayingList();
        emit(NowPlayingLoaded(nowPlayingEntity: entity));
      } catch (e) {
        emit(NowPlayingFailure(error: e.toString()));
      }
    });
  }
}
