import 'package:dartz/dartz.dart';
import 'package:mapping/features/login/data/datasource/firebase_login.dart';

import '../entities/user/login_user.dart';

abstract class UserSignIn {
  Future<Either<LoginFailure, LoginUser>> call(LoginUser user);
}
