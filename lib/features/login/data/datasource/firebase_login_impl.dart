import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mapping/features/login/data/datasource/firebase_login.dart';
import 'package:mapping/features/login/domain/entities/user/login_user.dart';
import 'package:mapping/utils/firebase_instance.dart';

@injectable
class FirebaseLoginImpl extends FirebaseLogin {
  @override
  Future<User> loadUser(LoginUser user) async {
    try {
      final userCredential = await fbAuth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      if (userCredential.user == null) {
        throw FirebaseAuthException(
          code: '404',
          message: "There's no such user.",
        );
      } else {
        return userCredential.user!;
      }
    } on FirebaseAuthException catch (err, stackTrace) {
      throw Error.throwWithStackTrace(err, stackTrace);
    } on Object catch (err, stackTrace) {
      throw Error.throwWithStackTrace(err, stackTrace);
    }
  }
}
