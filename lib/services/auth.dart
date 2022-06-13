// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mediplants_app/entities/register_entity.dart';
import 'package:mediplants_app/models/user.dart';

import 'package:http/http.dart' as http;

enum AuthStatus { Unitialized, Authenticated, Authenticating, Unauthenticated }

class AuthService with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthStatus _status = AuthStatus.Unitialized;
  // FetchUser fetchUser = FetchUser().createUser();
  UserModel _user = UserModel();
  RegisterEntity _registerEntity = RegisterEntity();
  final _client = http.Client();
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  final _registerUrl = Uri.parse("https://mediplants-api.herokuapp.com/users");

  // INSTANCIA DE AUTHSERVICE  QUE ESCUCHA EL ESTADO DE AUTH
  AuthService.instance() : _auth = FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

// ESTE FUTURE RECOGE LA INFORMACIÓN DEL FIREBASEUSER, SI EXISTE RECOGE EL UID ALMACENADO EN FIRESTORE
// ACTUALIZA LOS CAMBIOS QUE ESTÉN EN FIRESTORE Y TAMBIEN EL STATUS
  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser!.uid.isEmpty) {
      _status = AuthStatus.Unauthenticated;
    } else {
      final userDoc = _auth.currentUser;
      _user.setUser(userDoc);
      _status = AuthStatus.Authenticated;
    }
    notifyListeners();
  }

// REGISTRO DE USUARIO
  Future signUp(String name, String surname, String email, String password,
      context) async {
    try {
      // await FetchUser.createUser(name, surname, email, context);
      http.Response response = await _client.post(_registerUrl, body: {
        "name": name,
        "surname": surname,
        "email": email,
        "role": "user",
      });
      final _resJson = jsonDecode(response.body);
      final _userObject = RegisterEntity.fromjson(_resJson);
      if (response.statusCode == 201) {
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await EasyLoading.showSuccess("Successfull register",
            duration: Duration(seconds: 2), dismissOnTap: true);
        Navigator.pushNamed(context, "/");
      } else {
        await EasyLoading.showError("Error cod: ${_userObject.message}");
      }
    } catch (e) {
      await EasyLoading.showError("Error cod: ${e}",
          duration: Duration(seconds: 2), dismissOnTap: true);
    }
  }

// INICIO DE SESIÓN
  Future signIn(String email, String password, context) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      _user.setUser(userCredential.user);
      _status = AuthStatus.Authenticated;
      await EasyLoading.showSuccess("Successfull login",
          duration: Duration(seconds: 2), dismissOnTap: true);
      Navigator.pushNamed(context, "/");
    } on FirebaseAuthException catch (e) {
      _status = AuthStatus.Unitialized;
      await EasyLoading.showError("Error code: ${e}",
          duration: Duration(seconds: 2), dismissOnTap: true);
    }
    notifyListeners();
  }

  // CERRAR SESIÓN
  Future signOut(context) async {
    await _auth.signOut();
    _status = AuthStatus.Unauthenticated;
    await EasyLoading.showSuccess("Successfull logout",
        duration: Duration(seconds: 2), dismissOnTap: true);
    Navigator.pushNamed(context, "/welcome");
    notifyListeners();
  }

  AuthStatus get status => _status;
  UserModel get user => _user;
}
