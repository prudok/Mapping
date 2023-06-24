import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;

import '../../../../utils/firebase_instance.dart';
import '../../domain/entities/user/user.dart';
import 'firebase_login.dart';

class FirebaseLoginImpl extends FirebaseLogin {
  @override
  Future<Either<LoginFailure, User>> loadUser(User user) async {
    try {
      final userCredential = await firebaseInstance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user != null) {
        return Right(user);
      } else {
        return const Left(LoginFailure.invalidCredentials);
      }
    } on FirebaseAuthException catch (_) {
      return const Left(LoginFailure.error);
    }
  }
}
