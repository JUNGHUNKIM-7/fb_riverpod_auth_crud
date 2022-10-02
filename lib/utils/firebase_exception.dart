import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_mongo/utils/types.dart';

FutureVoid runOrExeption(FutureVoidCallback func) async {
  try {
    await func();
  } on FirebaseAuthException catch (e) {
    throw Exception('firebase err: ${e.message}');
  } catch (e) {
    throw Exception('another err related firebaseK ${e.toString()}');
  }
}
