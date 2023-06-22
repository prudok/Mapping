import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';

enum RegisterFailure { invalidCredentials, error }

abstract class FirebaseRegister {
  Future<Either<RegisterFailure, User>> loadUser(User user);
}
