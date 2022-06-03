import 'package:flutter/material.dart';

class Registro extends StatelessWidget{
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Center(child: Text("Registro"))
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 50, 50,30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Row(
                  children: const [
                    Expanded(child: Padding(
                      padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Text("Correo:"),
                    )),
                    Expanded(child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                      child: TextField(),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
               Padding(
                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                 child: Row(
                  children: const [
                    Expanded(child: Padding(
                      padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                      child: Text("Password:"),
                    )),
                    Expanded(child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                      child: TextField(obscureText: true,),
                    )),
                  ],
              ),
               ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
   
  
}