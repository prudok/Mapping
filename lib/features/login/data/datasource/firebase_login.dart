import '../../domain/entities/user/user.dart';

abstract class  FirebaseLogin {
  Future<User> loadUser(User user);
}
