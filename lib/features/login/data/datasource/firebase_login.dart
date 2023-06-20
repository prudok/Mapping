import 'package:dartz/dartz.dart';

import '../../domain/entities/user/user.dart';

enum LoginFailure { invalidCredentials, error }

abstract class FirebaseLogin {
  Future<Either<LoginFailure, User>> loadUser(User user);
}
