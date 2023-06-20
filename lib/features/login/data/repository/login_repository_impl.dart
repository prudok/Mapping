import 'package:dartz/dartz.dart';
import 'package:mapping/features/login/data/datasource/firebase_login.dart';
import 'package:mapping/features/login/data/datasource/firebase_login_impl.dart';

import '../../domain/entities/user/user.dart';
import '../../domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseLoginImpl firebaseLoginImpl;

  LoginRepositoryImpl(this.firebaseLoginImpl);


  @override
  Future<Either<LoginFailure, User>> signInUser(User user) async {
    return firebaseLoginImpl.loadUser(user);
  }
}
