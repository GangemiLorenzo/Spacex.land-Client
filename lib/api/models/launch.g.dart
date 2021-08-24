// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch(
    id: json['id'] as String?,
    launch_date_utc: json['launch_date_utc'] as String?,
    mission_name: json['mission_name'] as String?,
    details: json['details'] as String?,
  );
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'id': instance.id,
      'mission_name': instance.mission_name,
      'details': instance.details,
      'launch_date_utc': instance.launch_date_utc,
    };
