part of 'upcoming_bloc.dart';

abstract class UpcomingState extends Equatable {
  const UpcomingState();

  @override
  List<Object> get props => [];
}

class UpcomingInitial extends UpcomingState {}

class UpcomingLoading extends UpcomingState {}

class UpcomingLoaded extends UpcomingState {
  final UpcomingEntity upcomingEntity;

  const UpcomingLoaded({required this.upcomingEntity});

  @override
  List<Object> get props => [UpcomingEntity];
}

class UpcomingFailure extends UpcomingState {
  final String error;

  const UpcomingFailure({required this.error});

  @override
  List<Object> get props => [error];
}
