import 'package:freezed_annotation/freezed_annotation.dart';

import '../timestamp_converter.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
abstract class DetectionHistory with _$DetectionHistory {
  const factory DetectionHistory({
    required String imageURL,
    required double confidence,
    required int index,
    @TimestampConverter() required DateTime createdAt,
  }) = _DetectionHistory;

  factory DetectionHistory.fromJson(Map<String, dynamic> json) => _$DetectionHistoryFromJson(json);
}
