import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;

import '../../domain/entities/user.dart';
import 'firebase_register.dart';

class FirebaseLoginImpl extends FirebaseRegister {
  final firebaseInstance = FirebaseAuth.instance;

  @override
  Future<Either<RegisterFailure, User>> loadUser(User user) {
    // TODO: implement loadUser
    throw UnimplementedError();
  }
}
