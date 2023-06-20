import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_login.dart';
import '../entities/user/user.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, User>> signInUser(User user);
}
