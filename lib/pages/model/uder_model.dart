import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String fullName;
  final String emailAddress;
  final String password;
  final String userUID;

  UserModel({
    required this.fullName,
    required this.emailAddress,
    required this.password,
    required this.userUID
});

  factory UserModel.fromDocument(DocumentSnapshot doc){
    return UserModel(
        fullName: doc['Fullname'],
        emailAddress: doc['emailAddress'],
        password: doc['password'],
        userUID: doc['userUID']
    );
  }
}