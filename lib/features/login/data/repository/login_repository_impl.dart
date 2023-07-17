import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/login/data/datasource/firebase_login_impl.dart';
import 'package:mapping/features/login/domain/entities/login_user.dart';
import 'package:mapping/features/login/domain/repository/login_repository.dart';

@singleton
class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this.firebaseLoginImpl);

  final FirebaseLoginImpl firebaseLoginImpl;

  @override
  Future<User> signInUser(LoginUser user) {
    return firebaseLoginImpl.loadUser(user);
  }
}
