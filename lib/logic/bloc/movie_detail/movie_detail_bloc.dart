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
      print('loading');
      try {
        final MovieDetailEntity entity =
            await detailRepository.getMovieDetail(event.movieId);
        emit(MovieDetailLoaded(movieDetailEntity: entity));
      } catch (e) {
        emit(MovieDetailFailure(error: e.toString()));
      }
    });
  }
}
