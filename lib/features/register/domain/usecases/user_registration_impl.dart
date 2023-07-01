import 'package:dartz/dartz.dart';

import '../../data/datasource/firebase_register.dart';
import '../entities/user.dart';
import '../repository/register_repository.dart';
import 'user_registration.dart';

class UserRegistrationImpl extends UserRegistration {
  final RegisterRepository registerRepository;

  UserRegistrationImpl({required this.registerRepository});

  @override
  Future<Either<RegisterFailure, User>> call(User user) async {
    return await registerRepository.registerUser(user);
  }
}
