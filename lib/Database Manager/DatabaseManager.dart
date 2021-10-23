// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zara/models/app_user.dart';

class DatabaseManager {
  final CollectionReference userList =
      FirebaseFirestore.instance.collection("users");
  //Future<void> createUserData(AppUser user) async =>
  //  await userList.doc(user.uid).set({'Data': user});
  Future<void> createUserData(AppUser user) async =>
      await userList.doc(user.uid).set(user.toMap());
}
