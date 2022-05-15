import 'package:flutter/material.dart';

import 'pages/principal.dart';
import 'pages/unit_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediPlants',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => PrincipalPage(),
        "/unitproduct": (BuildContext context) => UnitProduct(),
      },
    );
  }
}
