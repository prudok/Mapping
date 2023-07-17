import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapping/features/register/domain/entities/user_registration_info.dart';
import 'package:mapping/utils/firebase_instance.dart';

extension FirestoreExt on FirebaseFirestore {
  // Working with user registration
  Future<void> addUserRegDetails(UserRegInfo user) async {
    await fbFireStore.collection('users').add(user.toJson());
  }

  Future<UserRegInfo> getUserDetails(String email) async {
    final snapshot = await fbFireStore
        .collection('users')
        .where('email', isEqualTo: email)
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
