import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  final String email;
  final String firstname;
  //final String userUid;
  UserModel({//required this.userUid
  required this.email,required this.firstname});
     factory UserModel.fromDocument(DocumentSnapshot doc){
       return UserModel(
         firstname:doc['fulname'],
         email:doc['email'],
        // userUid:doc['userUid']
       );
     }
}