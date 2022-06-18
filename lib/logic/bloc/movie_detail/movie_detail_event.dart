part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailFetched extends MovieDetailEvent {
  final String movieId;

  const MovieDetailFetched({required this.movieId});

  @override
  List<Object> get props => [movieId];
}