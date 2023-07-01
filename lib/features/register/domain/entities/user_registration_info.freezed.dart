// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_registration_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRegInfo _$UserRegInfoFromJson(Map<String, dynamic> json) {
  return _UserRegInfo.fromJson(json);
}

/// @nodoc
mixin _$UserRegInfo {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get surName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRegInfoCopyWith<UserRegInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegInfoCopyWith<$Res> {
  factory $UserRegInfoCopyWith(
          UserRegInfo value, $Res Function(UserRegInfo) then) =
      _$UserRegInfoCopyWithImpl<$Res, UserRegInfo>;
  @useResult
  $Res call({String email, String password, String name, String surName});
}

/// @nodoc
class _$UserRegInfoCopyWithImpl<$Res, $Val extends UserRegInfo>
    implements $UserRegInfoCopyWith<$Res> {
  _$UserRegInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? surName = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surName: null == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRegInfoCopyWith<$Res>
    implements $UserRegInfoCopyWith<$Res> {
  factory _$$_UserRegInfoCopyWith(
          _$_UserRegInfo value, $Res Function(_$_UserRegInfo) then) =
      __$$_UserRegInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String name, String surName});
}

/// @nodoc
class __$$_UserRegInfoCopyWithImpl<$Res>
    extends _$UserRegInfoCopyWithImpl<$Res, _$_UserRegInfo>
    implements _$$_UserRegInfoCopyWith<$Res> {
  __$$_UserRegInfoCopyWithImpl(
      _$_UserRegInfo _value, $Res Function(_$_UserRegInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? surName = null,
  }) {
    return _then(_$_UserRegInfo(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surName: null == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRegInfo with DiagnosticableTreeMixin implements _UserRegInfo {
  const _$_UserRegInfo(
      {required this.email,
      required this.password,
      required this.name,
      required this.surName});

  factory _$_UserRegInfo.fromJson(Map<String, dynamic> json) =>
      _$$_UserRegInfoFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String surName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserRegInfo(email: $email, password: $password, name: $name, surName: $surName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserRegInfo'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('surName', surName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegInfo &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surName, surName) || other.surName == surName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, name, surName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRegInfoCopyWith<_$_UserRegInfo> get copyWith =>
      __$$_UserRegInfoCopyWithImpl<_$_UserRegInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRegInfoToJson(
      this,
    );
  }
}

abstract class _UserRegInfo implements UserRegInfo {
  const factory _UserRegInfo(
      {required final String email,
      required final String password,
      required final String name,
      required final String surName}) = _$_UserRegInfo;

  factory _UserRegInfo.fromJson(Map<String, dynamic> json) =
      _$_UserRegInfo.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get name;
  @override
  String get surName;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegInfoCopyWith<_$_UserRegInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
