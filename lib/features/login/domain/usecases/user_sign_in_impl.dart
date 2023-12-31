import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/login/data/repository/login_repository_impl.dart';
import 'package:mapping/features/login/domain/entities/login_user.dart';
import 'package:mapping/features/login/domain/usecases/user_sign_in.dart';

@injectable
class UserSignInImpl extends UserSignIn {
  UserSignInImpl({required this.loginRepositoryImpl});

  final LoginRepositoryImpl loginRepositoryImpl;

  @override
  Future<User> call(LoginUser user) {
    return loginRepositoryImpl.signInUser(user);
  }
}
