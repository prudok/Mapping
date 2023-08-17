// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserRegInfo userRegInfo) registerUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserRegInfo userRegInfo)? registerUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserRegInfo userRegInfo)? registerUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(RegisterUser value) registerUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(RegisterUser value)? registerUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(RegisterUser value)? registerUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'RegisterEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserRegInfo userRegInfo) registerUser,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserRegInfo userRegInfo)? registerUser,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserRegInfo userRegInfo)? registerUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(RegisterUser value) registerUser,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(RegisterUser value)? registerUser,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(RegisterUser value)? registerUser,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RegisterEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$RegisterUserCopyWith<$Res> {
  factory _$$RegisterUserCopyWith(
          _$RegisterUser value, $Res Function(_$RegisterUser) then) =
      __$$RegisterUserCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRegInfo userRegInfo});

  $UserRegInfoCopyWith<$Res> get userRegInfo;
}

/// @nodoc
class __$$RegisterUserCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterUser>
    implements _$$RegisterUserCopyWith<$Res> {
  __$$RegisterUserCopyWithImpl(
      _$RegisterUser _value, $Res Function(_$RegisterUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRegInfo = null,
  }) {
    return _then(_$RegisterUser(
      userRegInfo: null == userRegInfo
          ? _value.userRegInfo
          : userRegInfo // ignore: cast_nullable_to_non_nullable
              as UserRegInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRegInfoCopyWith<$Res> get userRegInfo {
    return $UserRegInfoCopyWith<$Res>(_value.userRegInfo, (value) {
      return _then(_value.copyWith(userRegInfo: value));
    });
  }
}

/// @nodoc

class _$RegisterUser implements RegisterUser {
  const _$RegisterUser({required this.userRegInfo});

  @override
  final UserRegInfo userRegInfo;

  @override
  String toString() {
    return 'RegisterEvent.registerUser(userRegInfo: $userRegInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUser &&
            (identical(other.userRegInfo, userRegInfo) ||
                other.userRegInfo == userRegInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userRegInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserCopyWith<_$RegisterUser> get copyWith =>
      __$$RegisterUserCopyWithImpl<_$RegisterUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserRegInfo userRegInfo) registerUser,
  }) {
    return registerUser(userRegInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserRegInfo userRegInfo)? registerUser,
  }) {
    return registerUser?.call(userRegInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserRegInfo userRegInfo)? registerUser,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(userRegInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(RegisterUser value) registerUser,
  }) {
    return registerUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(RegisterUser value)? registerUser,
  }) {
    return registerUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(RegisterUser value)? registerUser,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(this);
    }
    return orElse();
  }
}

abstract class RegisterUser implements RegisterEvent {
  const factory RegisterUser({required final UserRegInfo userRegInfo}) =
      _$RegisterUser;

  UserRegInfo get userRegInfo;
  @JsonKey(ignore: true)
  _$$RegisterUserCopyWith<_$RegisterUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registering,
    required TResult Function(UserRegInfo userRegInfo) registered,
    required TResult Function(String failureMessage) registerFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registering,
    TResult? Function(UserRegInfo userRegInfo)? registered,
    TResult? Function(String failureMessage)? registerFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registering,
    TResult Function(UserRegInfo userRegInfo)? registered,
    TResult Function(String failureMessage)? registerFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Registered value) registered,
    required TResult Function(_RegisterFailed value) registerFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Registered value)? registered,
    TResult? Function(_RegisterFailed value)? registerFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Registering value)? registering,
    TResult Function(_Registered value)? registered,
    TResult Function(_RegisterFailed value)? registerFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registering,
    required TResult Function(UserRegInfo userRegInfo) registered,
    required TResult Function(String failureMessage) registerFailed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registering,
    TResult? Function(UserRegInfo userRegInfo)? registered,
    TResult? Function(String failureMessage)? registerFailed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registering,
    TResult Function(UserRegInfo userRegInfo)? registered,
    TResult Function(String failureMessage)? registerFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Registered value) registered,
    required TResult Function(_RegisterFailed value) registerFailed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Registered value)? registered,
    TResult? Function(_RegisterFailed value)? registerFailed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Registering value)? registering,
    TResult Function(_Registered value)? registered,
    TResult Function(_RegisterFailed value)? registerFailed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_RegisteringCopyWith<$Res> {
  factory _$$_RegisteringCopyWith(
          _$_Registering value, $Res Function(_$_Registering) then) =
      __$$_RegisteringCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RegisteringCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_Registering>
    implements _$$_RegisteringCopyWith<$Res> {
  __$$_RegisteringCopyWithImpl(
      _$_Registering _value, $Res Function(_$_Registering) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Registering implements _Registering {
  const _$_Registering();

  @override
  String toString() {
    return 'RegisterState.registering()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Registering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registering,
    required TResult Function(UserRegInfo userRegInfo) registered,
    required TResult Function(String failureMessage) registerFailed,
  }) {
    return registering();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registering,
    TResult? Function(UserRegInfo userRegInfo)? registered,
    TResult? Function(String failureMessage)? registerFailed,
  }) {
    return registering?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registering,
    TResult Function(UserRegInfo userRegInfo)? registered,
    TResult Function(String failureMessage)? registerFailed,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Registered value) registered,
    required TResult Function(_RegisterFailed value) registerFailed,
  }) {
    return registering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Registered value)? registered,
    TResult? Function(_RegisterFailed value)? registerFailed,
  }) {
    return registering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Registering value)? registering,
    TResult Function(_Registered value)? registered,
    TResult Function(_RegisterFailed value)? registerFailed,
    required TResult orElse(),
  }) {
    if (registering != null) {
      return registering(this);
    }
    return orElse();
  }
}

abstract class _Registering implements RegisterState {
  const factory _Registering() = _$_Registering;
}

/// @nodoc
abstract class _$$_RegisteredCopyWith<$Res> {
  factory _$$_RegisteredCopyWith(
          _$_Registered value, $Res Function(_$_Registered) then) =
      __$$_RegisteredCopyWithImpl<$Res>;
  @useResult
  $Res call({UserRegInfo userRegInfo});

  $UserRegInfoCopyWith<$Res> get userRegInfo;
}

/// @nodoc
class __$$_RegisteredCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_Registered>
    implements _$$_RegisteredCopyWith<$Res> {
  __$$_RegisteredCopyWithImpl(
      _$_Registered _value, $Res Function(_$_Registered) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRegInfo = null,
  }) {
    return _then(_$_Registered(
      userRegInfo: null == userRegInfo
          ? _value.userRegInfo
          : userRegInfo // ignore: cast_nullable_to_non_nullable
              as UserRegInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserRegInfoCopyWith<$Res> get userRegInfo {
    return $UserRegInfoCopyWith<$Res>(_value.userRegInfo, (value) {
      return _then(_value.copyWith(userRegInfo: value));
    });
  }
}

/// @nodoc

class _$_Registered implements _Registered {
  const _$_Registered({required this.userRegInfo});

  @override
  final UserRegInfo userRegInfo;

  @override
  String toString() {
    return 'RegisterState.registered(userRegInfo: $userRegInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Registered &&
            (identical(other.userRegInfo, userRegInfo) ||
                other.userRegInfo == userRegInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userRegInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisteredCopyWith<_$_Registered> get copyWith =>
      __$$_RegisteredCopyWithImpl<_$_Registered>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registering,
    required TResult Function(UserRegInfo userRegInfo) registered,
    required TResult Function(String failureMessage) registerFailed,
  }) {
    return registered(userRegInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registering,
    TResult? Function(UserRegInfo userRegInfo)? registered,
    TResult? Function(String failureMessage)? registerFailed,
  }) {
    return registered?.call(userRegInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registering,
    TResult Function(UserRegInfo userRegInfo)? registered,
    TResult Function(String failureMessage)? registerFailed,
    required TResult orElse(),
  }) {
    if (registered != null) {
      return registered(userRegInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Registered value) registered,
    required TResult Function(_RegisterFailed value) registerFailed,
  }) {
    return registered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Registered value)? registered,
    TResult? Function(_RegisterFailed value)? registerFailed,
  }) {
    return registered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Registering value)? registering,
    TResult Function(_Registered value)? registered,
    TResult Function(_RegisterFailed value)? registerFailed,
    required TResult orElse(),
  }) {
    if (registered != null) {
      return registered(this);
    }
    return orElse();
  }
}

abstract class _Registered implements RegisterState {
  const factory _Registered({required final UserRegInfo userRegInfo}) =
      _$_Registered;

  UserRegInfo get userRegInfo;
  @JsonKey(ignore: true)
  _$$_RegisteredCopyWith<_$_Registered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RegisterFailedCopyWith<$Res> {
  factory _$$_RegisterFailedCopyWith(
          _$_RegisterFailed value, $Res Function(_$_RegisterFailed) then) =
      __$$_RegisterFailedCopyWithImpl<$Res>;
  @useResult
  $Res call({String failureMessage});
}

/// @nodoc
class __$$_RegisterFailedCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterFailed>
    implements _$$_RegisterFailedCopyWith<$Res> {
  __$$_RegisterFailedCopyWithImpl(
      _$_RegisterFailed _value, $Res Function(_$_RegisterFailed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureMessage = null,
  }) {
    return _then(_$_RegisterFailed(
      failureMessage: null == failureMessage
          ? _value.failureMessage
          : failureMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterFailed implements _RegisterFailed {
  const _$_RegisterFailed({required this.failureMessage});

  @override
  final String failureMessage;

  @override
  String toString() {
    return 'RegisterState.registerFailed(failureMessage: $failureMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterFailed &&
            (identical(other.failureMessage, failureMessage) ||
                other.failureMessage == failureMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterFailedCopyWith<_$_RegisterFailed> get copyWith =>
      __$$_RegisterFailedCopyWithImpl<_$_RegisterFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() registering,
    required TResult Function(UserRegInfo userRegInfo) registered,
    required TResult Function(String failureMessage) registerFailed,
  }) {
    return registerFailed(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? registering,
    TResult? Function(UserRegInfo userRegInfo)? registered,
    TResult? Function(String failureMessage)? registerFailed,
  }) {
    return registerFailed?.call(failureMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? registering,
    TResult Function(UserRegInfo userRegInfo)? registered,
    TResult Function(String failureMessage)? registerFailed,
    required TResult orElse(),
  }) {
    if (registerFailed != null) {
      return registerFailed(failureMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Registering value) registering,
    required TResult Function(_Registered value) registered,
    required TResult Function(_RegisterFailed value) registerFailed,
  }) {
    return registerFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Registering value)? registering,
    TResult? Function(_Registered value)? registered,
    TResult? Function(_RegisterFailed value)? registerFailed,
  }) {
    return registerFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Registering value)? registering,
    TResult Function(_Registered value)? registered,
    TResult Function(_RegisterFailed value)? registerFailed,
    required TResult orElse(),
  }) {
    if (registerFailed != null) {
      return registerFailed(this);
    }
    return orElse();
  }
}

abstract class _RegisterFailed implements RegisterState {
  const factory _RegisterFailed({required final String failureMessage}) =
      _$_RegisterFailed;

  String get failureMessage;
  @JsonKey(ignore: true)
  _$$_RegisterFailedCopyWith<_$_RegisterFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
