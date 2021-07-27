import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_land_client/api/api.dart';

part 'launches_event.dart';

part 'launches_state.dart';

const _launchesLimit = 10;

class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  LaunchesBloc({LaunchesApiClient? launchesApiClient})
      : assert(launchesApiClient != null),
        _launchesApiClient = launchesApiClient!,
        super(LaunchesState());

  final LaunchesApiClient _launchesApiClient;

  Future<LaunchesState> _mapLaunchesFetchedToState(
      LaunchesState state, String mission_name) async {
    try {
      final launches =
          await _launchesApiClient.getLaunches(mission_name, _launchesLimit, 0);
      if (launches.isEmpty)
        return state.copyWith(
            status: LaunchesStatus.initial,
            mission_name: mission_name,
            hasReachedMax: false);
      return state.copyWith(
          status: LaunchesStatus.success,
          launches: launches,
          hasReachedMax: false,
          mission_name: mission_name);
    } on Exception {
      return state.copyWith(
          status: LaunchesStatus.failure, mission_name: mission_name);
    }
  }

  Future<LaunchesState> _mapLaunchesAddToState(LaunchesState state) async {
    if (state.hasReachedMax) return state;
    try {
      final launches = await _launchesApiClient.getLaunches(
          state.mission_name, _launchesLimit, state.launches.length);
      if (launches.isEmpty) return state.copyWith(hasReachedMax: true);
      if (launches.isNotEmpty)
        return state.copyWith(
          status: LaunchesStatus.success,
          launches: List.of(state.launches)..addAll(launches),
          hasReachedMax: false,
        );
      return state;
    } on Exception {
      return state.copyWith(status: LaunchesStatus.failure);
    }
  }

  @override
  Stream<LaunchesState> mapEventToState(
    LaunchesEvent event,
  ) async* {
    if (event is LaunchesFetchStarted) {
      if (event.mission_name.length > 3) {
        yield state.copyWith(status: LaunchesStatus.progress);
        yield await _mapLaunchesFetchedToState(state, event.mission_name);
      } else
        yield LaunchesState();
    }
    if (event is LaunchesFetchAdd) {
      yield await _mapLaunchesAddToState(state);
    }
  }
}
