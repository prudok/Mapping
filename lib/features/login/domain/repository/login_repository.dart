import '../entities/user/user.dart';

abstract class LoginRepository {
  Future<void> signInUser(User user);
}
