import 'package:dio/dio.dart';
import 'package:go_mongo/auth/auth.dart';
import 'package:go_mongo/crud/crud.dart';
import 'package:go_mongo/models/postbody.dart';
import 'package:go_mongo/utils/enums.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/userbody.dart';
import 'state_notifiers.dart';

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>((ref) {
  return DarkModeNotifier();
});

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final loadingProvider = StateProvider<bool>((ref) {
  return false;
});

final userBodyProvider = StateProvider<Userbody>((ref) {
  return Userbody();
});

final postBodyProvider = StateProvider<Postbody>((ref) {
  return Postbody(title: "", body: "");
});

final authProvider = Provider<Auth>((ref) {
  final userBody = ref.watch(userBodyProvider);
  return Auth.instance(userBody: userBody);
});

late Map<String, dynamic> newData;

final userCrudProvider = Provider<Crud>((ref) {
  final user = ref.watch(authProvider).currUser;
  final data = Userbody.fromJson(ref.watch(userBodyProvider).toJson());

  newData = {
    "email": data.email,
    "password": data.password,
    "user": user?.uid,
  };

  return Crud.instance(collName: CollTypes.user, data: newData, user: user);
});

final postCrudProvider = Provider<Crud>((ref) {
  final user = ref.watch(authProvider).currUser;
  final data = Postbody.fromJson(ref.watch(postBodyProvider).toJson());

  late Map<String, dynamic> newData;
  newData = {
    "title": data.title,
    "body": data.body,
    "user": user?.uid,
  };

  return Crud.instance(collName: CollTypes.post, data: newData, user: user);
});
