import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
import 'package:injectable/injectable.dart';
import 'package:mapping/features/register/data/datasource/firebase_register.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/utils/firebase_instance.dart';

@injectable
class FirebaseRegisterImpl extends FirebaseRegister {
  @override
  Future<UserRegInfo> loadUser(
    UserRegInfo user,
  ) async {
    try {
      final userCredential = await fbAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user == null) {
        throw FirebaseAuthException(
          code: '404',
          message: "There's no such user.",
        );
      } else {
        return user;
      }
    } on FirebaseAuthException catch (err, stackTrace) {
      Error.throwWithStackTrace(err, stackTrace);
    } on Object catch (err, stackTrace) {
      throw Error.throwWithStackTrace(err, stackTrace);
    }
  }
}
