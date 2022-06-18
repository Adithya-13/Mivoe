part of 'upcoming_bloc.dart';

abstract class UpcomingEvent extends Equatable {
  const UpcomingEvent();

  @override
  List<Object> get props => [];
}

class UpcomingFetched extends UpcomingEvent {}
