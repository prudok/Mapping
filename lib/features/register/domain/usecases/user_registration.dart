import 'package:mapping/features/register/domain/entities/user_registration_info.dart';

abstract class UserRegistration {
  Future<UserRegInfo> call(UserRegInfo user);
}
