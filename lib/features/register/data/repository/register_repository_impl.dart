import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/firebase_register.dart';

class RegisterRepositoryImpl extends RegisterRepository {

  @override
  Future<Either<RegisterFailure, User>> registerUser(User user) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

}