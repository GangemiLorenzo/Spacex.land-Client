import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  final String? mission_name;
  final String? details;

  Launch({ this.mission_name,  this.details});

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
