import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user/login_user.dart';


enum LoginFailure { invalidCredentials, error }

abstract class FirebaseLogin {
  Future<Either<LoginFailure, User>> loadUser(LoginUser user);
}
