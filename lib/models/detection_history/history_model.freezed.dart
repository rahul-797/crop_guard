// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetectionHistory {

 String get imageURL; double get confidence; int get index;
/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetectionHistoryCopyWith<DetectionHistory> get copyWith => _$DetectionHistoryCopyWithImpl<DetectionHistory>(this as DetectionHistory, _$identity);

  /// Serializes this DetectionHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetectionHistory&&(identical(other.imageURL, imageURL) || other.imageURL == imageURL)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageURL,confidence,index);

@override
String toString() {
  return 'DetectionHistory(imageURL: $imageURL, confidence: $confidence, index: $index)';
}


}

/// @nodoc
abstract mixin class $DetectionHistoryCopyWith<$Res>  {
  factory $DetectionHistoryCopyWith(DetectionHistory value, $Res Function(DetectionHistory) _then) = _$DetectionHistoryCopyWithImpl;
@useResult
$Res call({
 String imageURL, double confidence, int index
});




}
/// @nodoc
class _$DetectionHistoryCopyWithImpl<$Res>
    implements $DetectionHistoryCopyWith<$Res> {
  _$DetectionHistoryCopyWithImpl(this._self, this._then);

  final DetectionHistory _self;
  final $Res Function(DetectionHistory) _then;

/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageURL = null,Object? confidence = null,Object? index = null,}) {
  return _then(_self.copyWith(
imageURL: null == imageURL ? _self.imageURL : imageURL // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DetectionHistory implements DetectionHistory {
  const _DetectionHistory({required this.imageURL, required this.confidence, required this.index});
  factory _DetectionHistory.fromJson(Map<String, dynamic> json) => _$DetectionHistoryFromJson(json);

@override final  String imageURL;
@override final  double confidence;
@override final  int index;

/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetectionHistoryCopyWith<_DetectionHistory> get copyWith => __$DetectionHistoryCopyWithImpl<_DetectionHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetectionHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetectionHistory&&(identical(other.imageURL, imageURL) || other.imageURL == imageURL)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.index, index) || other.index == index));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageURL,confidence,index);

@override
String toString() {
  return 'DetectionHistory(imageURL: $imageURL, confidence: $confidence, index: $index)';
}


}

/// @nodoc
abstract mixin class _$DetectionHistoryCopyWith<$Res> implements $DetectionHistoryCopyWith<$Res> {
  factory _$DetectionHistoryCopyWith(_DetectionHistory value, $Res Function(_DetectionHistory) _then) = __$DetectionHistoryCopyWithImpl;
@override @useResult
$Res call({
 String imageURL, double confidence, int index
});




}
/// @nodoc
class __$DetectionHistoryCopyWithImpl<$Res>
    implements _$DetectionHistoryCopyWith<$Res> {
  __$DetectionHistoryCopyWithImpl(this._self, this._then);

  final _DetectionHistory _self;
  final $Res Function(_DetectionHistory) _then;

/// Create a copy of DetectionHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageURL = null,Object? confidence = null,Object? index = null,}) {
  return _then(_DetectionHistory(
imageURL: null == imageURL ? _self.imageURL : imageURL // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
