import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mivoe/mivoe.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final DetailRepository detailRepository;
  MovieDetailBloc({required this.detailRepository})
      : super(MovieDetailInitial()) {
    on<MovieDetailFetched>((event, emit) async {
      emit(MovieDetailLoading());
      final result = await detailRepository.getMovieDetail(event.movieId);
      result.when(
        success: ((entity) {
          emit(MovieDetailLoaded(movieDetailEntity: entity));
        }),
        failure: (error) {
          emit(MovieDetailFailure(
              error: NetworkExceptions.getErrorMessage(error)));
        },
      );
    });
  }
}
