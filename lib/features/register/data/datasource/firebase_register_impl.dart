import 'package:dartz/dartz.dart';

import '../../domain/entities/user.dart';
import 'firebase_register.dart';

class FirebaseLoginImpl extends FirebaseRegister {
  @override
  Future<Either<RegisterFailure, User>> loadUser(User user) {
    // TODO: implement loadUser
    throw UnimplementedError();
  }
}
