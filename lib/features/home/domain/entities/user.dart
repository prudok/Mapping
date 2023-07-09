import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required String surName,
    @Default(0) int goalOfTheWeek,
    @Default([]) List<String> routes,
  }) = _User;

  @override
  factory User.fromJson(Map<String, Object?> json) =>
      _$UserFromJson(json);
}
