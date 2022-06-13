import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediplants_app/pages/login.dart';
import 'package:http/http.dart' as http;
import '../pages/principal.dart';


class AuthService{

  final auth = FirebaseAuth.instance; 
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController cellphone = TextEditingController();


  static final _client = http.Client();
  static var _registerUrl = Uri.parse("https://mediplants-api.herokuapp.com/users");

  void loginUser(context) async {
    String validate = '';

    try {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(child: CircularProgressIndicator()),
        );
      });

      await auth
      .signInWithEmailAndPassword(
        email: email.text, password: password.text)
        .then((value) =>{
        print("user is logged in"), 
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => PrincipalPage()), 
          (route) => false)
      });
    } on FirebaseAuthException catch (e){
      if (e.code == 'user-not-found') {
        validate = 'El correo ingresado no esta registrado';
      } else if (e.code == 'wrong-password') {
        validate = 'Contraseña incorrecta';
      }


      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Alerta"),
            content: Text(validate.toString()),
          );
        });
    }
  }

  void registerUser(context) async {
    String validate = ''; 

    try {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Center(child: CircularProgressIndicator()),
        );
      });

      await auth
      .createUserWithEmailAndPassword(
        email: email.text, password: password.text).then((value) async {
        print("user is register");
        http.Response response = await _client.post(_registerUrl, body: {
          "name": name.text,
          "surname": surname.text,
          "email": email.text,
          "cellphone": cellphone.text,
          "fireid": auth.currentUser!.uid
        });
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => PrincipalPage()));
      });
    }
    on FirebaseAuthException catch (e){

      if (e.code == 'weak-password') {
        validate = 'La conseña es debil';
      } else if (e.code == 'email-already-in-use') {
        validate = 'El correo ingresado ya esta registrado';
      }


      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            title: Text("Alerta"),
            content: Text(validate.toString()),
          );
      });
    }
  }

  void logOutUser(context) async{
    await auth.signOut();
    Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (context) => Login()), 
          (route) => false);
  }
}

