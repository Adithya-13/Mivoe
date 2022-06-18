part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final PopularEntity popularEntity;

  const PopularLoaded({required this.popularEntity});

  @override
  List<Object> get props => [PopularEntity];
}

class PopularFailure extends PopularState {
  final String error;

  const PopularFailure({required this.error});

  @override
  List<Object> get props => [error];
}
