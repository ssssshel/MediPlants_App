// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mediplants_app/pages/register.dart';
import 'package:mediplants_app/services/auth.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

const kPrimaryColor = Color.fromARGB(255,141,196,94);
const kPrimaryLightColor = Color.fromARGB(90,228,236,171);
const double defaultPadding = 30.0;

class _LoginState extends State<Login> {
  AuthService authService = AuthService.instance();
  late String email;
  late String password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding * 2),
        Text(
          "¡Bienvenido a MediPlants!",
          style: TextStyle(fontSize: 18),
        ),
        Row(
          children: [
           Spacer(),
            Expanded(
              flex: 10,
              child: Image.asset("assets/login.png"),

            ),
           Spacer(),
          ],
        ),
        Row(
          children: [
           Spacer(),
            Flexible(
            flex: 50,
            child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    hintText: "Ingrese su correo",
                    border: InputBorder.none
                  ),
                ),
               ),
               Container( 
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29)
                ),
                child:  TextFormField(
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
                    hintText: "Ingrese su contraseña",
                    icon: Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    border: InputBorder.none
                  ),
                ),
                ),
                SizedBox(height: defaultPadding),
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          } else {
                            // FetchUser.login(email, password, context);
                            authService.signIn(email, password, context);
                          }
                      },
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Register();
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
      ]
    )
    )
    );
  }
}


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "¿No tiene una cuenta? " : "¿Ya tiene una cuenta? ",
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
