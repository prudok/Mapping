import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_registration_info.dart';
import '../../domain/repository/register_repository.dart';
import '../datasource/firebase_register.dart';
import '../datasource/firebase_register_impl.dart';

@singleton
class RegisterRepositoryImpl extends RegisterRepository {
  final FirebaseRegisterImpl firebaseRegisterImpl;

  RegisterRepositoryImpl(this.firebaseRegisterImpl);

  @override
  Future<Either<RegisterFailure, UserRegInfo>> registerUser(UserRegInfo user) {
    return firebaseRegisterImpl.loadUser(user);
  }
}
