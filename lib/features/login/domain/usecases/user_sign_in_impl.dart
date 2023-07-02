import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../data/datasource/firebase_login.dart';
import '../../data/repository/login_repository_impl.dart';
import '../entities/user/login_user.dart';
import 'user_sign_in.dart';

@injectable
class UserSignInImpl extends UserSignIn {
  final LoginRepositoryImpl loginRepositoryImpl;

  UserSignInImpl({required this.loginRepositoryImpl});

  @override
  Future<Either<LoginFailure, User>> call(LoginUser user) async {
    return await loginRepositoryImpl.signInUser(user);
  }
}
