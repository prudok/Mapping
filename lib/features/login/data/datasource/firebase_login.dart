import 'package:dartz/dartz.dart';

import '../../domain/entities/user/login_user.dart';

enum LoginFailure { invalidCredentials, error }

abstract class FirebaseLogin {
  Future<Either<LoginFailure, LoginUser>> loadUser(LoginUser user);
}
