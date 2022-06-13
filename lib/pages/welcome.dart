// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Center(
                    child: Text(
                  "Bienvenido a Mediplants",
                  style: TextStyle(fontSize: 26),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Center(
                      child: Text("Registrate"),
                    ),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.lightGreen),
                  )),
              MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Center(
                      child: Text("Iniciar sesión"),
                    ),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                  )),
            ]),
      ),
    );
  }
}
