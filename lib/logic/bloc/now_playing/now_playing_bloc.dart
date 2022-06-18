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
      final result = await dashboardRepository.getNowPlayingList();
      result.when(
        success: ((entity) {
          emit(NowPlayingLoaded(nowPlayingEntity: entity));
        }),
        failure: (error) {
          emit(NowPlayingFailure(error: NetworkExceptions.getErrorMessage(error)));
        },
      );
    });
  }
}
