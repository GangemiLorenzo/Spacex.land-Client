import 'package:json_annotation/json_annotation.dart';

part 'rocket.g.dart';

@JsonSerializable()
class Rocket {
  final String? id;
  final String? name;
  final String? description;


  Rocket(
      {this.id,
      this.name,
      this.description,});

  factory Rocket.fromJson(Map<String, dynamic> json) => _$RocketFromJson(json);

  Map<String, dynamic> toJson() => _$RocketToJson(this);
}
