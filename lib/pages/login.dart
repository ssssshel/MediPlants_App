// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:mediplants_app/services/auth.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService authService = AuthService.instance();
  late String email;
  late String password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Iniciar sesión")),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un correo';
                    }
                    return null;
                  },
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(hintText: "Correo electrónico"),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa una contraseña';
                    } else if (value.length < 8) {
                      return 'Ingrese una contraseña mayor a 8 dígitos';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Contraseña"),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                SizedBox(height: 40),
                MaterialButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    } else {
                      // FetchUser.login(email, password, context);
                      authService.signIn(email, password, context);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text("Iniciar sesión"),
                    ),
                    height: 40,
                    decoration: BoxDecoration(color: Colors.lightGreen),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
