part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchFetched extends SearchEvent {
  final String query;

  const SearchFetched({required this.query});

  @override
  List<Object> get props => [query];
}
