import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediplants_app/controller/helper.dart';

import '../pages/register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  AuthService authService = AuthService();

  late String emails;
  late String passwords;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(36.0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Iniciar sesion",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  TextFormField(
                  controller: authService.email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un correo';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Correo electrónico"),
                  onChanged: (value) {
                    setState(() {
                      emails = value;
                    });
                  },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                  controller: authService.password,
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
                      passwords = value;
                    });
                  },
                ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      if (authService.email != "" && authService.password != ""){
                        authService.loginUser(context);
                      }
                    },
                    child: const Text("Iniciar sesion "),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register(),));
                  }, 
                  child: Text("¿No tienes cuenta? Registrate"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class ErrorOccured extends StatelessWidget {
  final AsyncSnapshot<User> snapshot;
  const ErrorOccured({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.red,
            radius: 28.0,
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Failed to create an account",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(snapshot.error.toString()),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
              primary: Colors.red,
            ),
            child: const Text("Close"),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.green,
            radius: 28.0,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            "Account Creation Successful",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text("We successfully created an account with us."),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
              primary: Colors.green,
            ),
            child: const Text("Continue"),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
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
            "Account creation in Progress",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
