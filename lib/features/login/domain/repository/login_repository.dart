import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapping/features/login/domain/entities/login_user.dart';

abstract class LoginRepository {
  Future<User> signInUser(LoginUser user);
}
