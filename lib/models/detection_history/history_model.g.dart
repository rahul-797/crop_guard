// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetectionHistory _$DetectionHistoryFromJson(Map<String, dynamic> json) =>
    _DetectionHistory(
      imageURL: json['imageURL'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      index: (json['index'] as num).toInt(),
    );

Map<String, dynamic> _$DetectionHistoryToJson(_DetectionHistory instance) =>
    <String, dynamic>{
      'imageURL': instance.imageURL,
      'confidence': instance.confidence,
      'index': instance.index,
    };
