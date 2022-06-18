import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mivoe/mivoe.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  final DashboardRepository dashboardRepository;
  TopRatedBloc({required this.dashboardRepository}) : super(TopRatedInitial()) {
    on<TopRatedFetched>((event, emit) async {
      emit(TopRatedLoading());
      try {
        final TopRatedEntity entity =
            await dashboardRepository.getTopRatedList();
        emit(TopRatedLoaded(topRatedEntity: entity));
      } catch (e) {
        emit(TopRatedFailure(error: e.toString()));
      }
    });
  }
}
