import 'package:freezed_annotation/freezed_annotation.dart';

part 'postbody.freezed.dart';
part 'postbody.g.dart';

@freezed
class Postbody with _$Postbody {
  factory Postbody({
    required String title,
    required String body,
  }) = _Postbody;

  factory Postbody.fromJson(Map<String, Object?> json) =>
      _$PostbodyFromJson(json);
}