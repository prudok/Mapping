import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

// TODO: Implement fromJson/toJson methods
@freezed
class User with _$User {
  const factory User({
    required String email,
    required String password,
    required String name,
    required String surName,
  }) = _User;

  @override
  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
