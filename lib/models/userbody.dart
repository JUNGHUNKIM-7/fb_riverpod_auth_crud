import 'package:freezed_annotation/freezed_annotation.dart';

part 'userbody.freezed.dart';
part 'userbody.g.dart';

@freezed
class Userbody with _$Userbody {
  factory Userbody({
    @Default("") String email,
    @Default("") String password,
    @Default("") String name,
    @Default("") String addr,
  }) = _Userbody;

  factory Userbody.fromJson(Map<String, Object?> json) =>
      _$UserbodyFromJson(json);
}
