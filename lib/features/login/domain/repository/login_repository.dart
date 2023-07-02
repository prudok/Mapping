import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/datasource/firebase_login.dart';
import '../entities/user/login_user.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, User>> signInUser(LoginUser user);
}
