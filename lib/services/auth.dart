// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:mediplants_app/models/user.dart';

enum AuthStatus { Unitialized, Authenticated, Authenticating, Unanthenticated }

class AuthService with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel _user = UserModel();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  AuthStatus _status = AuthStatus.Unitialized;

  // INSTANCIA DE AUTHSERVICE  QUE ESCUCHA EL ESTADO DE AUTH
  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

// ESTE FUTURE RECOGE LA INFORMACIÓN DEL FIREBASEUSER, SI EXISTE RECOGE EL UID ALMACENADO EN FIRESTORE
// ACTUALIZA LOS CAMBIOS QUE ESTÉN EN FIRESTORE Y TAMBIEN EL STATUS
  Future<void> _onAuthStateChanged(User ? firebaseUser) async {
    if (firebaseUser == null) {
      _status = AuthStatus.Unanthenticated;
    } else {
      DocumentSnapshot userSnap =
          await _db.collection('users').doc(firebaseUser.uid).get();

      _user.setFromFirestore(userSnap);
      _status = AuthStatus.Authenticated;
    }

    notifyListeners();
  }

  // AGREGAR RESPUESTA PARA EASYLAODING "USERENTITY"

  Future signUp(
      String name, String surname, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _status = AuthStatus.Authenticated;
    } on FirebaseAuthException catch (e) {
      _status = AuthStatus.Unitialized;
      return e.message;
    }
    notifyListeners();
  }

  Future signOut()async{
    await _auth.signOut();
    _status = AuthStatus.Unanthenticated;
    notifyListeners();
  }

  AuthStatus get status => _status;
  UserModel get user => _user;
}
