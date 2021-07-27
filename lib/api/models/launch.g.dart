// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) {
  return Launch(
    mission_name: json['mission_name'] as String?,
    details: json['details'] as String?,
  );
}

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
      'mission_name': instance.mission_name,
      'details': instance.details,
    };
