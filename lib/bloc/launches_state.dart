part of 'launches_bloc.dart';

/*
class LaunchesInitial extends LaunchesState {}

class LaunchesLoadInProgress extends LaunchesState {
}

class LaunchesLoadSuccess extends LaunchesState {
  LaunchesLoadSuccess(this.launches);

  final List<Launch> launches;
}

class LaunchesLoadFailure extends LaunchesState {}
*/





enum LaunchesStatus { initial, progress, success, failure }

class LaunchesState extends Equatable {
  const LaunchesState({
    this.mission_name = '',
    this.status = LaunchesStatus.initial,
    this.launches = const <Launch>[],
    this.hasReachedMax = false,
  });

  final String mission_name;
  final LaunchesStatus status;
  final List<Launch> launches;
  final bool hasReachedMax;

  LaunchesState copyWith({
    String? mission_name,
    LaunchesStatus? status,
    List<Launch>? launches,
    bool? hasReachedMax,
  }) {
    return LaunchesState(
      mission_name: mission_name??this.mission_name,
      status: status ?? this.status,
      launches: launches ?? this.launches,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }


  @override
  List<Object> get props => [status, launches, hasReachedMax];
}