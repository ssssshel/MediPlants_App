import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mediplants_app/controller/helper.dart';
import 'package:mediplants_app/pages/login.dart';

import '../api/users/fetch_users.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String names;
  late String surname;
  late String emails;
  late String passwords;
  late String phonenumber;

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Registro")),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: authService.name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un nombre';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Nombres"),
                  onChanged: (value) {
                    setState(() {
                      names = value;
                    });
                  },
                ),
                TextFormField(
                  controller: authService.surname,
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
                  controller: authService.cellphone,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un telefono';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Telefono"),
                  onChanged: (value) {
                    setState(() {
                      phonenumber = value;
                    });
                  },
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
                SizedBox(height: 20),
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
                        authService.registerUser(context);
                    }
                    
                  },
                  child: const Text("Crear cuenta"),
                )
              ],
            ),
          ),
        ));
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
            "Error al crear una cuenta",
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
            "Su cuenta se creo correctamente",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text("Creo con exito una cuenta."),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
              primary: Colors.green,
            ),
            child: const Text("Continuar"),
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
            "Creando cuenta",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}