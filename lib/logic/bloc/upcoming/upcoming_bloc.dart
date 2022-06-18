import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mivoe/mivoe.dart';

part 'upcoming_event.dart';
part 'upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final DashboardRepository dashboardRepository;
  UpcomingBloc({required this.dashboardRepository}) : super(UpcomingInitial()) {
    on<UpcomingFetched>((event, emit) async {
      emit(UpcomingLoading());
      try {
        final UpcomingEntity entity =
            await dashboardRepository.getUpcomingList();
        emit(UpcomingLoaded(upcomingEntity: entity));
      } catch (e) {
        emit(UpcomingFailure(error: e.toString()));
      }
    });
  }
}
