import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? email;

  UserModel({this.id, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
      );

  toJson() => {
        ['id']: id,
        ['email']: email,
      };

  factory UserModel.fromDoc(DocumentSnapshot<Map<String, dynamic>> source) =>
      UserModel.fromJson(source.data()!);
}