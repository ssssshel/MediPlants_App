import 'package:flutter/material.dart';
// import 'package:login/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login());
  }
}

// ignore: must_be_immutable
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Login"))),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 50, 50, 30),
            child: Row(
              children: const [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Text("Correo:"),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                  child: TextField(),
                )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 50),
            child: Row(
              children: const [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                  child: Text("Password:"),
                )),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                  child: TextField(
                    obscureText: true,
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // ListTile(
          //   title: const Center(child: Text("Registrate")),
          //   onTap: () {
          //     Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const Registro()),
          //     );
          //   }
          // ),
        ],
      ),
    );
  }
}
