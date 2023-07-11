import 'package:mapping/features/register/domain/entities/user_registration_info.dart';

abstract class FirebaseRegister {
  Future<UserRegInfo> loadUser(UserRegInfo user);
}
