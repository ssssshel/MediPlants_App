// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mediplants_app/pages/login.dart';
import 'package:mediplants_app/services/auth.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

const kPrimaryColor = Color.fromARGB(255,141,196,94);
const kPrimaryLightColor = Color.fromARGB(90,228,236,171);
const double defaultPadding = 30.0;

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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
          child:
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
            children: [
              SizedBox(height: defaultPadding),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: Image.asset("assets/register.png"),
                  ),
                  const Spacer(),
                ],
              ),
              Text(
                "Crear cuenta en MediPlants",
              ),
              SizedBox(height: defaultPadding * 0.8),
            ],
          ),
          Row(
          children: [
           Spacer(),
            Flexible(
            flex: 40,
            child:  Form(
            key: _formKey,
            child: Column(
              children: [
                  Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.5),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Nombre",
                    border: InputBorder.none
                  ),
                  )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un apellido';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      surname = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Apellidos",
                    border: InputBorder.none
                  ),
                  )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un número de celular';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      cellphone = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.phone_android,
                      color: kPrimaryColor,
                    ),
                    hintText: "Número de celular",
                    border: InputBorder.none
                  ),
                  )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa un correo';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: kPrimaryColor,
                    ),
                    hintText: "Correo electronico",
                    border: InputBorder.none
                  ),
                )
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 6),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(29)
                  ),
                  child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa una contraseña';
                    } else if (value.length < 8) {
                      return 'Ingrese una contraseña mayor a 8 dígitos';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    hintText: "Contraseña",
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    border: InputBorder.none
                  ),
                  )
                ),
                const SizedBox(height: defaultPadding),
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            authService.signUp(
                                name, surname, email, password, cellphone, context);
                          }
                      },
                      child: Text(
                        "Registrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          )
          ]
          )
        ],
      )
      )
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

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "No tiene una cuenta? " : "Ya tiene una cuenta? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Registrarse" : "Iniciar sesión",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}