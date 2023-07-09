import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapping/features/login/data/datasource/firebase_login.dart';
import 'package:mapping/features/login/domain/entities/user/login_user.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, User>> signInUser(LoginUser user);
}
