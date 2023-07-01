import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration_info.freezed.dart';

part 'user_registration_info.g.dart';

@freezed
class UserRegInfo with _$UserRegInfo {
  const factory UserRegInfo({
    required String email,
    required String password,
    required String name,
    required String surName,
  }) = _UserRegInfo;

  @override
  factory UserRegInfo.fromJson(Map<String, Object?> json) =>
      _$UserRegInfoFromJson(json);
}
