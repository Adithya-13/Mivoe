import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mivoe/mivoe.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(SearchInitial()) {
    on<SearchFetched>(
      (event, emit) async {
        emit(SearchLoading());
        try {
          final SearchEntity entity =
              await searchRepository.getSearchList(event.query);
          emit(SearchLoaded(searchEntity: entity));
        } catch (e) {
          emit(SearchFailure(error: e.toString()));
        }
      },
      transformer: debounceSequential(const Duration(milliseconds: 300)),
    );
  }
  EventTransformer<Event> debounceSequential<Event>(Duration duration) {
    return (events, mapper) =>
        events.debounceTime(duration).asyncExpand(mapper);
  }
}
