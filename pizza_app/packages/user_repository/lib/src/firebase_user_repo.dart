import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/entities/entities.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> logOut() async => _firebaseAuth.signOut();

  @override
  Future<void> setUserDate(MyUser user) async {
    try {
      await usersCollection.doc(user.userId).set(user.toEntity().toJson());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signIn({required String email, required String password}) {
    try {
      return _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUser> signUp({required MyUser user, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: user.email, password: password);
      user.userId = userCredential.user!.uid;
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Stream<MyUser?> get user =>
      _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
        if (firebaseUser == null) {
          yield MyUser.empty;
        } else {
          yield await usersCollection.doc(firebaseUser.uid).get().then(
              (doc) => MyUser.fromEntity(MyUserEntity.fromJson(doc.data()!)));
        }
      });
}
