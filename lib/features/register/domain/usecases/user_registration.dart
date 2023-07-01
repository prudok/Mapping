import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_register.dart';
import '../entities/user.dart';

abstract class UserRegistration {
  Future<Either<RegisterFailure, User>> call(User user);
}
