import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/register/data/datasource/firebase_register.dart';
import 'package:mapping/features/register/data/datasource/firebase_register_impl.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/features/register/domain/repository/register_repository.dart';

@singleton
class RegisterRepositoryImpl extends RegisterRepository {
  RegisterRepositoryImpl(this.firebaseRegisterImpl);

  final FirebaseRegisterImpl firebaseRegisterImpl;

  @override
  Future<Either<RegisterFailure, UserRegInfo>> registerUser(UserRegInfo user) {
    return firebaseRegisterImpl.loadUser(user);
  }
}
