part of 'launches_bloc.dart';

abstract class LaunchesEvent {}

class LaunchesFetchStarted extends LaunchesEvent {
  final String mission_name;

  LaunchesFetchStarted(this.mission_name);
}

class LaunchesFetchAdd extends LaunchesEvent {
}
