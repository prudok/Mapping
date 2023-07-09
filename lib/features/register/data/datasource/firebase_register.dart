import 'package:dartz/dartz.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';

enum RegisterFailure { invalidCredentials, error }

abstract class FirebaseRegister {
  Future<Either<RegisterFailure, UserRegInfo>> loadUser(UserRegInfo user);
}
