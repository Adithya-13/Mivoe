part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final SearchEntity searchEntity;

  const SearchLoaded({required this.searchEntity});

  @override
  List<Object> get props => [searchEntity];
}

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure({required this.error});

  @override
  List<Object> get props => [error];
}
