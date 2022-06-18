import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mivoe/mivoe.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final DashboardRepository dashboardRepository;
  PopularBloc({required this.dashboardRepository}) : super(PopularInitial()) {
    on<PopularFetched>((event, emit) async {
      emit(PopularLoading());
      final result = await dashboardRepository.getPopularList();
      result.when(
        success: ((entity) {
          emit(PopularLoaded(popularEntity: entity));
        }),
        failure: (error) {
          emit(PopularFailure(error: NetworkExceptions.getErrorMessage(error)));
        },
      );
    });
  }
}
