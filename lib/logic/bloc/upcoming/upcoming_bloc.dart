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
      final result = await dashboardRepository.getUpcomingList();
      result.when(
        success: ((entity) {
          emit(UpcomingLoaded(upcomingEntity: entity));
        }),
        failure: (error) {
          emit(
              UpcomingFailure(error: NetworkExceptions.getErrorMessage(error)));
        },
      );
    });
  }
}
