import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String password;

  UserModel({
    required this.email,
    required this.password,
  });

  toJson() {
    return {
      'Email': email,
      'Password': password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UserModel(
      email: data?['Email'],
      password: data?['Password'],
    );
  }
}
