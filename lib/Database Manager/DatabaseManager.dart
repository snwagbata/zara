// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference userList =
      FirebaseFirestore.instance.collection("users");
  Future<void> createUserData(String name, String uid) async => await userList.doc(uid).set({
      'name': name
    });
}
