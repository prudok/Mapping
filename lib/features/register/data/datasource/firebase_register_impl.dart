import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;

import '../../../../utils/firebase_instance.dart';
import '../../domain/entities/user.dart';
import 'firebase_register.dart';

class FirebaseRegisterImpl extends FirebaseRegister {
  @override
  Future<Either<RegisterFailure, User>> loadUser(User user) async {
    try {
      final userCredential =
          await firebaseInstance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user != null) {
        return Right(user);
      } else {
        return const Left(RegisterFailure.invalidCredentials);
      }
    } on FirebaseAuthException catch (_) {
      return const Left(RegisterFailure.error);
    }
  }
}
