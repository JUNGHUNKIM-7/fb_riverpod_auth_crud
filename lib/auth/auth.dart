import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_mongo/models/userbody.dart';
import 'package:go_mongo/utils/firebase_exception.dart';

import '../utils/types.dart';

abstract class AuthBase {
  final FirebaseAuth _fb = FirebaseAuth.instance;
  Stream<User?> get authChanges => _fb.authStateChanges();
  User? get currUser => _fb.currentUser;

  FutureVoid signin();
  FutureVoid signup();
  FutureVoid signout();
  FutureVoid reload();
}

class Auth extends AuthBase {
  Auth._({
    required Userbody userBody,
  }) : _userBody = userBody;

  final Userbody _userBody;

  factory Auth.instance({
    required Userbody userBody,
  }) =>
      Auth._(userBody: userBody);

  @override
  FutureVoid signin() async => await runOrExeption(
        () async => await _fb.signInWithEmailAndPassword(
          email: _userBody.email,
          password: _userBody.password,
        ),
      );
  @override
  FutureVoid signup() async => await runOrExeption(
        () async => await _fb.createUserWithEmailAndPassword(
          email: _userBody.email,
          password: _userBody.password,
        ),
      );
  @override
  FutureVoid signout() async => await _fb.signOut();
  @override
  FutureVoid reload() async => await _fb.currentUser?.reload();
}
