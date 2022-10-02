// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'postbody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Postbody _$PostbodyFromJson(Map<String, dynamic> json) {
  return _Postbody.fromJson(json);
}

/// @nodoc
mixin _$Postbody {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostbodyCopyWith<Postbody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostbodyCopyWith<$Res> {
  factory $PostbodyCopyWith(Postbody value, $Res Function(Postbody) then) =
      _$PostbodyCopyWithImpl<$Res>;
  $Res call({String title, String body});
}

/// @nodoc
class _$PostbodyCopyWithImpl<$Res> implements $PostbodyCopyWith<$Res> {
  _$PostbodyCopyWithImpl(this._value, this._then);

  final Postbody _value;
  // ignore: unused_field
  final $Res Function(Postbody) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PostbodyCopyWith<$Res> implements $PostbodyCopyWith<$Res> {
  factory _$$_PostbodyCopyWith(
          _$_Postbody value, $Res Function(_$_Postbody) then) =
      __$$_PostbodyCopyWithImpl<$Res>;
  @override
  $Res call({String title, String body});
}

/// @nodoc
class __$$_PostbodyCopyWithImpl<$Res> extends _$PostbodyCopyWithImpl<$Res>
    implements _$$_PostbodyCopyWith<$Res> {
  __$$_PostbodyCopyWithImpl(
      _$_Postbody _value, $Res Function(_$_Postbody) _then)
      : super(_value, (v) => _then(v as _$_Postbody));

  @override
  _$_Postbody get _value => super._value as _$_Postbody;

  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_Postbody(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Postbody implements _Postbody {
  _$_Postbody({required this.title, required this.body});

  factory _$_Postbody.fromJson(Map<String, dynamic> json) =>
      _$$_PostbodyFromJson(json);

  @override
  final String title;
  @override
  final String body;

  @override
  String toString() {
    return 'Postbody(title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Postbody &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_PostbodyCopyWith<_$_Postbody> get copyWith =>
      __$$_PostbodyCopyWithImpl<_$_Postbody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostbodyToJson(
      this,
    );
  }
}

abstract class _Postbody implements Postbody {
  factory _Postbody({required final String title, required final String body}) =
      _$_Postbody;

  factory _Postbody.fromJson(Map<String, dynamic> json) = _$_Postbody.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_PostbodyCopyWith<_$_Postbody> get copyWith =>
      throw _privateConstructorUsedError;
}
