import 'package:flutter/material.dart';

import '../api/users/fetch_users.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String name;
  late String surname;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Registro")),
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          
          TextField(
            decoration: InputDecoration(hintText: "Nombres"),
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Apellidos"),
            onChanged: (value) {
              setState(() {
                surname = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: "Correo electrónico"),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          TextField(
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
            onPressed: () async {FetchUser.register(name, surname, email, password, context);},
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
                child: Center(
              child: Text("Registrar"),
            ),height: 40,
            decoration: BoxDecoration(color: Colors.lightGreen),
            ),
            
          )
        ],
      ),
    ));
  }
}
