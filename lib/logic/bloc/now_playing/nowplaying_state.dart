part of 'nowplaying_bloc.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final NowPlayingEntity nowPlayingEntity;

  const NowPlayingLoaded({required this.nowPlayingEntity});

  @override
  List<Object> get props => [nowPlayingEntity];
}

class NowPlayingFailure extends NowPlayingState {
  final String error;

  const NowPlayingFailure({required this.error});

  @override
  List<Object> get props => [error];
}
