import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'pages/principal.dart';
import 'pages/unit_product.dart';
import 'pages/order_resume.dart';
import 'pages/order_details.dart';

Future main() async {
  await DotEnv().load(fileName: '.env');
  runApp(MyApp());
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
        "/orderresume": (context) => OrderResume(),
        "/orderdetails": (BuildContext context) => OrderDetails(),
        // "/login":(context) =>
      },
    );
  }
}
