import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String ? id;
  String ? email;

  UserModel({this.id, this.email});

  factory UserModel.fromFirestore(DocumentSnapshot userDoc) {
    dynamic userData = userDoc.data;
    return UserModel(
      id: userDoc.id,
      email: userData['email']
    );
  }

  void setFromFirestore(DocumentSnapshot userDoc){
    dynamic userData = userDoc.data;
    id = userDoc.id;
    email = userData['email'];
    notifyListeners();
  }
}
