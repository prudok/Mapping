import 'package:dartz/dartz.dart';
import 'package:mapping/features/register/data/datasource/firebase_register.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';

abstract class UserRegistration {
  Future<Either<RegisterFailure, UserRegInfo>> call(UserRegInfo user);
}
