import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/register/domain/entities/user.dart';
import 'firebase_instance.dart';

extension FirestoreExt on FirebaseFirestore {
  Future addUserDetails(User user) async {
    await firebaseFireStoreInstance.collection('users').add({
      'name': user.name,
      'surname': user.surName,
      'email': user.email,
    });
  }

  Future<User> getUserDetails(String email) async {
    final snapshot = await firebaseFireStoreInstance
        .collection('users')
        .where("email", isEqualTo: email)
        .get();
    final userData =
        snapshot.docs.map((doc) => User.fromJson(doc.data())).single;
    return userData;
  }

  Future<List<User>> getAllUsers() async {
    final snapshot = await firebaseFireStoreInstance.collection('users').get();
    final userData =
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList();
    return userData;
  }
}
