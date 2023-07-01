import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_register.dart';
import '../entities/user_registration_info.dart';

abstract class RegisterRepository {
  Future<Either<RegisterFailure, UserRegInfo>> registerUser(UserRegInfo user);
}
