import 'package:injectable/injectable.dart';
import 'package:mapping/features/register/data/repository/register_repository_impl.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/features/register/domain/usecases/user_registration.dart';

@injectable
class UserRegistrationImpl extends UserRegistration {
  UserRegistrationImpl({required this.registerRepositoryImpl});

  final RegisterRepositoryImpl registerRepositoryImpl;

  @override
  Future<UserRegInfo> call(UserRegInfo user) {
    return registerRepositoryImpl.registerUser(user);
  }
}
