import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_land_client/bloc/launches_bloc.dart';
import 'package:spacex_land_client/ui/components/components.dart';

class LaunchesList extends StatefulWidget {
  const LaunchesList({
    Key? key,
  }) : super(key: key);

  @override
  _LaunchesListState createState() => _LaunchesListState();
}

class _LaunchesListState extends State<LaunchesList> {
  final _scrollController = ScrollController();
  late LaunchesBloc _launchesBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _launchesBloc = context.read<LaunchesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchesBloc, LaunchesState>(builder: (context, state) {
      return ListView.builder(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: state.hasReachedMax
            ? state.launches.length
            : state.launches.length + 1,
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index >= state.launches.length) return BottomLoader();
          final launch = state.launches[index];
          if (index == 0)
            return Column(
              children: [
                Container(
                  height: 80,
                ),
                LaunchCard(launch: launch)
              ],
            );
          return LaunchCard(launch: launch);
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _launchesBloc.add(LaunchesFetchAdd());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}
