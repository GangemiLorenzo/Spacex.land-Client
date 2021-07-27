import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_land_client/bloc/launches_bloc.dart';
import 'package:spacex_land_client/ui/components/neomorph_container.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaunchesBloc, LaunchesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: NeomorphContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                onChanged: (text) => {
                  context
                      .read<LaunchesBloc>()
                      .add(LaunchesFetchStarted(text))
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  labelText: 'Search launch',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
