// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  userId: json['userId'] as String,
  displayName: json['displayName'] as String,
  email: json['email'] as String,
  photoURL: json['photoURL'] as String?,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
  detectionHistory:
      (json['detectionHistory'] as List<dynamic>?)
          ?.map((e) => DetectionHistory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'userId': instance.userId,
  'displayName': instance.displayName,
  'email': instance.email,
  'photoURL': instance.photoURL,
  'createdAt': _$JsonConverterToJson<dynamic, DateTime>(
    instance.createdAt,
    const TimestampConverter().toJson,
  ),
  'detectionHistory': instance.detectionHistory,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
