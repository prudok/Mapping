import 'package:cloud_firestore/cloud_firestore.dart';

import '../features/register/domain/entities/user_registration_info.dart';
import 'firebase_instance.dart';

extension FirestoreExt on FirebaseFirestore {
  Future addUserDetails(UserRegInfo user) async {
    await fbFireStore.collection('users').add(user.toJson());
  }

  Future<UserRegInfo> getUserDetails(String email) async {
    final snapshot = await fbFireStore
        .collection('users')
        .where("email", isEqualTo: email)
        .get();
    final userData =
        snapshot.docs.map((doc) => UserRegInfo.fromJson(doc.data())).single;
    return userData;
  }

  Future<List<UserRegInfo>> getAllUsers() async {
    final snapshot = await fbFireStore.collection('users').get();
    final userData =
        snapshot.docs.map((doc) => UserRegInfo.fromJson(doc.data())).toList();
    return userData;
  }
}
