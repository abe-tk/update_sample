// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_UpdateInfo _$$_UpdateInfoFromJson(Map<String, dynamic> json) =>
    _$_UpdateInfo(
      latestVer: json['latestVer'] as String,
      requiredVer: json['requiredVer'] as String,
      enabledAt: DateTime.parse(json['enabledAt'] as String),
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_UpdateInfoToJson(_$_UpdateInfo instance) =>
    <String, dynamic>{
      'latestVer': instance.latestVer,
      'requiredVer': instance.requiredVer,
      'enabledAt': instance.enabledAt.toIso8601String(),
    };
