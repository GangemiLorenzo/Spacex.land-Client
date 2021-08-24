import 'package:json_annotation/json_annotation.dart';

//import 'models.dart';

part 'launch.g.dart';


@JsonSerializable()
class Launch {
  final String? id;
  final String? mission_name;
  final String? details;
  final String? launch_date_utc;
  //final Map<String, Object>? rocket;

  Launch(
      {this.id,
      this.launch_date_utc,
      //this.rocket,
      this.mission_name,
      this.details});

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);

}



