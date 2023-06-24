import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/firebase_register.dart';
import '../datasource/firebase_register_impl.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final FirebaseRegisterImpl firebaseRegisterImpl;

  RegisterRepositoryImpl(this.firebaseRegisterImpl);

  @override
  Future<Either<RegisterFailure, User>> registerUser(User user) {
    return firebaseRegisterImpl.loadUser(user);
  }
}
