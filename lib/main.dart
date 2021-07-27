import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_land_client/api/api.dart';
import 'package:spacex_land_client/bloc/launches_bloc.dart';
import 'package:spacex_land_client/ui/pages/launches_page.dart';

void main() => runApp(MyApp(launchesApiClient: LaunchesApiClient.create()));

class MyApp extends StatelessWidget {
  const MyApp({required this.launchesApiClient});

  final LaunchesApiClient launchesApiClient;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => LaunchesBloc(
          launchesApiClient: launchesApiClient,
        ),
        child: LaunchesPage(),
      ),
    );
  }
}
