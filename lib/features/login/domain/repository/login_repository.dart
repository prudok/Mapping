import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_login.dart';
import '../entities/user/login_user.dart';

abstract class LoginRepository {
  Future<Either<LoginFailure, LoginUser>> signInUser(LoginUser user);
}
