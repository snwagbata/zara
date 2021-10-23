import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:zara/models/app_user.dart';

class AppUserService with ChangeNotifier {
  AppUser? appUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AppUserService(String? user) {
    _firestore.collection('users').doc(user!).get().then((value) {
      appUser = AppUser.fromMap(value.data()!);
      notifyListeners();
    });
  }
}
