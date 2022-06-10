import 'package:flutter/material.dart';
import 'package:mediplants_app/api/users/fetch_users.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      FetchUser.login(email, password, context);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text("Registrar"),
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
