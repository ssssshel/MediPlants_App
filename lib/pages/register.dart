// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mediplants_app/services/auth.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService authService = AuthService.instance();
  late String name;
  late String surname;
  late String email;
  late String password;
  late String cellphone;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registro")),
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
                      return 'Ingresa un nombre';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Nombres"),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un apellido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Apellidos"),
                  onChanged: (value) {
                    setState(() {
                      surname = value;
                    });
                  },
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un número de celular';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Celular"),
                  onChanged: (value) {
                    setState(() {
                      cellphone = value;
                    });
                  },
                ),
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
                      authService.signUp(
                          name, surname, email, password, cellphone, context);
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

class InProgress extends StatelessWidget {
  const InProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Creando cuenta",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}