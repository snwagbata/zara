import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zara/models/app_user.dart';

class Auth with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Use the following with Provider for determining if the user is logged in
  /// Will return null if not logged in
  /// Because Firebase's state persistence, there will be no need to worry about user state persistence
  Stream<User?> get user {
    return _auth.userChanges();
  }

  /// Create user with email and password
  /// Returns a Future<User>
  /// If the user is created successfully, the user will be logged in and a document will be created in the users collection
  /// If the user is not created successfully, the user will not be logged in and be notified of the error
  /// TODO: Add a way to handle the error, snackbar, etc.
  Future<User?> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = userCredential.user;
      // Create user document if above is successful and send to firestore
      AppUser appUser = AppUser(
        uid: user!.uid,
        name: name,
        email: email,
        classes: [],
      );
      await _firestore
          .collection('users')
          .doc(appUser.uid)
          .set(appUser.toMap());
      // Notify widget tree that the user has been created
      notifyListeners();
      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
