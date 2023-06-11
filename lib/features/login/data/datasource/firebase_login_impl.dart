import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

import '../../domain/entities/user/user.dart';
import 'firebase_login.dart';

class FirebaseLoginImpl extends FirebaseLogin {
  final firebaseInstance = FirebaseAuth.instance;
  @override
  Future<User> loadUser(User user) async {
    final userCredential = await firebaseInstance.signInWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );

    if (userCredential.user != null) {
      return user;
    } 
    // TODO: Handle error signing in
    else {
      return const User(email: 'error', password: 'error');
    }
  }
}
