import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/firebase_instance.dart';
import '../../domain/entities/user/login_user.dart';
import 'firebase_login.dart';

@injectable
class FirebaseLoginImpl extends FirebaseLogin {
  @override
  Future<Either<LoginFailure, LoginUser>> loadUser(LoginUser user) async {
    try {
      final userCredential = await fbAuth.signInWithEmailAndPassword(
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
