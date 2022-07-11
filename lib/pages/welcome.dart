// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mediplants_app/pages/login.dart';
import 'package:mediplants_app/pages/register.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    const double defaultPadding = 30.0;
    const kPrimaryColor = Color.fromARGB(255,141,196,94);
    const kPrimaryLightColor = Color.fromARGB(90,228,236,171);
    final Size size = MediaQuery.of(context).size;

    return
      Scaffold(
      backgroundColor: Color.fromARGB(255,203,227,100),
      resizeToAvoidBottomInset : false,
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
      children: [
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 20,
              child: Image.asset("assets/logo.png"),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
          ],
        ),
        Row(
          children: [ 
            const Spacer(),
            Expanded(
              flex: 8,
              child: Column(
              children: [
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () async {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      color: kPrimaryColor,
                      onPressed: () async {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Register();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Registrarse",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
             ],
            ),
            ),
            Spacer(),
          ],
        ),
      ],
    )
    );
  }
}
