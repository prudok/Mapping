import 'package:dartz/dartz.dart';

import '../../domain/entities/user/login_user.dart';
import '../../domain/repository/login_repository.dart';
import '../datasource/firebase_login.dart';
import '../datasource/firebase_login_impl.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseLoginImpl firebaseLoginImpl;

  LoginRepositoryImpl(this.firebaseLoginImpl);


  @override
  Future<Either<LoginFailure, LoginUser>> signInUser(LoginUser user) async {
    return firebaseLoginImpl.loadUser(user);
  }
}
