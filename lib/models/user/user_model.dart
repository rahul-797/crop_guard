import 'package:freezed_annotation/freezed_annotation.dart';

import '../detection_history/history_model.dart';
import '../timestamp_converter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String userId,
    required String displayName,
    required String email,
    String? photoURL,
    @TimestampConverter() DateTime? createdAt,
    @Default([]) List<DetectionHistory> detectionHistory,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}
