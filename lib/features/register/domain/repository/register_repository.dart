import 'package:mapping/features/register/domain/entities/user_registration_info.dart';

abstract class RegisterRepository {
  Future<UserRegInfo> registerUser(UserRegInfo user);
}
