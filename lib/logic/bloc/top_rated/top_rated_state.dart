part of 'top_rated_bloc.dart';

abstract class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final TopRatedEntity topRatedEntity;

  const TopRatedLoaded({required this.topRatedEntity});

  @override
  List<Object> get props => [TopRatedEntity];
}

class TopRatedFailure extends TopRatedState {
  final String error;

  const TopRatedFailure({required this.error});

  @override
  List<Object> get props => [error];
}
