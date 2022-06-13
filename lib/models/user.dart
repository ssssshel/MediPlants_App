import 'package:flutter/cupertino.dart';

class UserModel with ChangeNotifier {
  String? id;
  String? email;

  UserModel({this.id, this.email});

  void setUser(userDoc) {
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
