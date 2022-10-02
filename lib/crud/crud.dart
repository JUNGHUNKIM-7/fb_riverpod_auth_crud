import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_mongo/utils/firebase_exception.dart';

import '../utils/enums.dart';
import '../utils/types.dart';

abstract class CrudBase {
  CrudBase({
    required CollTypes collName,
    required Map<String, dynamic> data,
  })  : _collName = collName,
        _data = data;

  final CollTypes _collName;
  final Map<String, dynamic> _data;
  final _fb = FirebaseFirestore.instance;

  Coll get coll => _fb.collection(_collName.value);

  FutureVoid insertDoc();
  FutureVoid delDoc({String? id});
  FutureVoid updateDoc({String? id, required Map<String, dynamic> newData});
}

class Crud extends CrudBase {
  Crud._({
    required super.collName,
    required super.data,
    this.user,
  });

  final User? user;

  factory Crud.instance({
    required CollTypes collName,
    Map<String, dynamic> data = const <String, dynamic>{},
    User? user,
  }) {
    switch (collName) {
      case CollTypes.user:
        return Crud._(collName: collName, data: data, user: user);
      case CollTypes.post:
        return Crud._(collName: collName, data: data, user: user);
      default:
        throw Exception("invalid collName");
    }
  }

  @override
  FutureVoid insertDoc() async {
    if (user != null) {
      await runOrExeption(() async => await coll.add(_data));
    }
  }

  @override
  FutureVoid delDoc({String? id}) async {
    if (user != null) {
      await runOrExeption(() async => await coll.doc(id).delete());
    }
  }

  @override
  FutureVoid updateDoc(
      {String? id, required Map<String, dynamic> newData}) async {
    if (user != null) {
      await runOrExeption(() async => await coll.doc(id).update(newData));
    }
  }
}
