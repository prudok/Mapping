import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_register.dart';
import '../../data/repository/register_repository_impl.dart';
import '../entities/user_registration_info.dart';
import 'user_registration.dart';

class UserRegistrationImpl extends UserRegistration {
  final RegisterRepositoryImpl registerRepositoryImpl;

  UserRegistrationImpl({required this.registerRepositoryImpl});

  @override
  Future<Either<RegisterFailure, UserRegInfo>> call(UserRegInfo user) async {
    return await registerRepositoryImpl.registerUser(user);
  }
}
