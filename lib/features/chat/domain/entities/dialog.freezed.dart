// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dialog _$DialogFromJson(Map<String, dynamic> json) {
  return _Dialog.fromJson(json);
}

/// @nodoc
mixin _$Dialog {
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DialogCopyWith<Dialog> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogCopyWith<$Res> {
  factory $DialogCopyWith(Dialog value, $Res Function(Dialog) then) =
      _$DialogCopyWithImpl<$Res, Dialog>;
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class _$DialogCopyWithImpl<$Res, $Val extends Dialog>
    implements $DialogCopyWith<$Res> {
  _$DialogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DialogCopyWith<$Res> implements $DialogCopyWith<$Res> {
  factory _$$_DialogCopyWith(_$_Dialog value, $Res Function(_$_Dialog) then) =
      __$$_DialogCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Message> messages});
}

/// @nodoc
class __$$_DialogCopyWithImpl<$Res>
    extends _$DialogCopyWithImpl<$Res, _$_Dialog>
    implements _$$_DialogCopyWith<$Res> {
  __$$_DialogCopyWithImpl(_$_Dialog _value, $Res Function(_$_Dialog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$_Dialog(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dialog implements _Dialog {
  const _$_Dialog({required final List<Message> messages})
      : _messages = messages;

  factory _$_Dialog.fromJson(Map<String, dynamic> json) =>
      _$$_DialogFromJson(json);

  final List<Message> _messages;
  @override
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'Dialog(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Dialog &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DialogCopyWith<_$_Dialog> get copyWith =>
      __$$_DialogCopyWithImpl<_$_Dialog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DialogToJson(
      this,
    );
  }
}

abstract class _Dialog implements Dialog {
  const factory _Dialog({required final List<Message> messages}) = _$_Dialog;

  factory _Dialog.fromJson(Map<String, dynamic> json) = _$_Dialog.fromJson;

  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_DialogCopyWith<_$_Dialog> get copyWith =>
      throw _privateConstructorUsedError;
}
