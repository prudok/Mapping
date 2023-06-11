import '../entities/user/user.dart';

abstract class UserSignIn {
  Future<void> call(User user);
}
