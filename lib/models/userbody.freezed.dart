// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'userbody.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Userbody _$UserbodyFromJson(Map<String, dynamic> json) {
  return _Userbody.fromJson(json);
}

/// @nodoc
mixin _$Userbody {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get addr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserbodyCopyWith<Userbody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserbodyCopyWith<$Res> {
  factory $UserbodyCopyWith(Userbody value, $Res Function(Userbody) then) =
      _$UserbodyCopyWithImpl<$Res>;
  $Res call({String email, String password, String name, String addr});
}

/// @nodoc
class _$UserbodyCopyWithImpl<$Res> implements $UserbodyCopyWith<$Res> {
  _$UserbodyCopyWithImpl(this._value, this._then);

  final Userbody _value;
  // ignore: unused_field
  final $Res Function(Userbody) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? addr = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      addr: addr == freezed
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_UserbodyCopyWith<$Res> implements $UserbodyCopyWith<$Res> {
  factory _$$_UserbodyCopyWith(
          _$_Userbody value, $Res Function(_$_Userbody) then) =
      __$$_UserbodyCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password, String name, String addr});
}

/// @nodoc
class __$$_UserbodyCopyWithImpl<$Res> extends _$UserbodyCopyWithImpl<$Res>
    implements _$$_UserbodyCopyWith<$Res> {
  __$$_UserbodyCopyWithImpl(
      _$_Userbody _value, $Res Function(_$_Userbody) _then)
      : super(_value, (v) => _then(v as _$_Userbody));

  @override
  _$_Userbody get _value => super._value as _$_Userbody;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
    Object? name = freezed,
    Object? addr = freezed,
  }) {
    return _then(_$_Userbody(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      addr: addr == freezed
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Userbody implements _Userbody {
  _$_Userbody(
      {this.email = "", this.password = "", this.name = "", this.addr = ""});

  factory _$_Userbody.fromJson(Map<String, dynamic> json) =>
      _$$_UserbodyFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String addr;

  @override
  String toString() {
    return 'Userbody(email: $email, password: $password, name: $name, addr: $addr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Userbody &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.addr, addr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(addr));

  @JsonKey(ignore: true)
  @override
  _$$_UserbodyCopyWith<_$_Userbody> get copyWith =>
      __$$_UserbodyCopyWithImpl<_$_Userbody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserbodyToJson(
      this,
    );
  }
}

abstract class _Userbody implements Userbody {
  factory _Userbody(
      {final String email,
      final String password,
      final String name,
      final String addr}) = _$_Userbody;

  factory _Userbody.fromJson(Map<String, dynamic> json) = _$_Userbody.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get name;
  @override
  String get addr;
  @override
  @JsonKey(ignore: true)
  _$$_UserbodyCopyWith<_$_Userbody> get copyWith =>
      throw _privateConstructorUsedError;
}
