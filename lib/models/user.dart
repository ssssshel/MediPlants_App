import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String? id;
  String? email;

  UserModel({this.id, this.email});

  // factory UserModel.fromFirestore(DocumentSnapshot userDoc) {
  //   dynamic userData = userDoc.data;
  //   return UserModel(
  //     id: userDoc.id,
  //     email: userData['email']
  //   );
  // }

  void setUser(userDoc) {
    // dynamic userData = userDoc.data;
    id = userDoc.uid;
    email = userDoc.email;
    notifyListeners();
  }

  UserModel getUser() {
    return UserModel(
      id: id,
      email: email,
    );
  }
}
