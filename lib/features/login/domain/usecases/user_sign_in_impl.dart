import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_login.dart';
import '../entities/user/login_user.dart';
import '../repository/login_repository.dart';
import 'user_sign_in.dart';

class UserSignInImpl extends UserSignIn {
  UserSignInImpl(this.loginRepository);
  final LoginRepository loginRepository;

  @override
  Future<Either<LoginFailure, LoginUser>> call(LoginUser user) async {
    return await loginRepository.signInUser(user);
  }
}
