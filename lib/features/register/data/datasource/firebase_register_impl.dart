import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:injectable/injectable.dart';
import 'package:mapping/features/register/data/datasource/firebase_register.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/utils/firebase_instance.dart';

@injectable
class FirebaseRegisterImpl extends FirebaseRegister {
  @override
  Future<Either<RegisterFailure, UserRegInfo>> loadUser(
    UserRegInfo user,
  ) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
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
