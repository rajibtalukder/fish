import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'user_model.dart';

class UserController extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel userModel) async {
    await _db.collection('User').doc().set(userModel.toJson()).catchError((e) {
      print(e);
    });
  }
}
