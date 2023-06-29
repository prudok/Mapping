import '../entities/user/login_user.dart';

abstract class UserSignIn {
  Future<void> call(LoginUser user);
}
