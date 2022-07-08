// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://previews.123rf.com/images/catarchangel/catarchangel1508/catarchangel150800054/43392786-modelo-incons%C3%BAtil-con-las-hojas-de-dibujo-acuarela-plantas-silvestres-pintados-ilustraci%C3%B3n-bot%C3%A1nica-.jpg",
              ))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                "En MediPlants nos dedicamos a la promoción y venta de productos naturales, nuestro propósito es difundir la medicina ancestral peruana y contribuír así en mejorar la salud de nuestros clientes.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {},
              child: Text(
                "Conoce más",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              color: Colors.lightGreen,
            )
          ],
        ),
      ),
    ));
  }
}
