import 'package:mapping/features/login/data/datasource/firebase_login_impl.dart';

import '../../domain/entities/user/user.dart';
import '../../domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final FirebaseLoginImpl firebaseLoginImpl;

  LoginRepositoryImpl(this.firebaseLoginImpl);


  @override
  Future<void> signInUser(User user) async {
    firebaseLoginImpl.loadUser(user);
  }
}
