import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_user.freezed.dart';

@freezed
class LoginUser with _$LoginUser {
  const factory LoginUser({
    required String email,
    required String password,
  }) = _LoginUser;
}
