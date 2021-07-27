import 'package:flutter/material.dart';
import 'package:spacex_land_client/api/api.dart';
import 'package:spacex_land_client/ui/components/neomorph_container.dart';
import 'package:spacex_land_client/ui/theme_data.dart';

class LaunchCard extends StatelessWidget {

  const LaunchCard({required this.launch});

  final Launch launch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: NeomorphContainer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(launch.mission_name??'No mission name', style: TS_CARD_TITLE),
              Container(
                height: 16,
              ),
              Text(
                launch.details??'No launch details.',
                style: TS_CARD_CONTENT,
              )
            ],
          ),
        ),
      ),
    );
  }
}
