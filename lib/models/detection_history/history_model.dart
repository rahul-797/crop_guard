import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
abstract class DetectionHistory with _$DetectionHistory {
  const factory DetectionHistory({
    required String imageURL,
    required double confidence,
    required int index,
  }) = _DetectionHistory;

  factory DetectionHistory.fromJson(Map<String, dynamic> json) => _$DetectionHistoryFromJson(json);
}
