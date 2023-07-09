import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/login/data/datasource/firebase_login.dart';
import 'package:mapping/features/login/domain/entities/user/login_user.dart';
import 'package:mapping/utils/firebase_instance.dart';

@injectable
class FirebaseLoginImpl extends FirebaseLogin {
  @override
  Future<Either<LoginFailure, User>> loadUser(LoginUser user) async {
    try {
      final userCredential = await fbAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user != null) {
        return Right(userCredential.user!);
      } else {
        return const Left(LoginFailure.invalidCredentials);
      }
    } on FirebaseAuthException catch (_) {
      return const Left(LoginFailure.error);
    }
  }
}
