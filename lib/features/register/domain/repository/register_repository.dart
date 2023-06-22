import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_register.dart';
import '../entities/user.dart';

abstract class RegisterRepository {
  Future<Either<RegisterFailure, User>> registerUser(User user);
}