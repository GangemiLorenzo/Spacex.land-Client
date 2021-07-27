import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacex_land_client/bloc/launches_bloc.dart';
import 'package:spacex_land_client/ui/components/components.dart';

class LaunchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: BlocBuilder<LaunchesBloc, LaunchesState>(
            builder: (context, state) {
              return Stack(
                children: [
                  if (state.status == LaunchesStatus.progress)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  if (state.status == LaunchesStatus.success) LaunchesList(),
                  if (state.status == LaunchesStatus.failure)
                    Expanded(
                        child: Center(child: Text('Launches load failed!'))),
                  if (state.status == LaunchesStatus.initial) buildNoData(),
                  SearchBar(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildNoData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
          SvgPicture.asset('assets/rocket.svg', semanticsLabel: 'Rocket image'),
    );
  }
}
