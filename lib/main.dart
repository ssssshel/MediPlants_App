import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'pages/welcome.dart';
import 'pages/register.dart';
import 'pages/login.dart';
import 'pages/principal.dart';
import 'pages/unit_product.dart';
import 'pages/order_resume.dart';
import 'pages/order_details.dart';

// Future main() async {
//   await DotEnv().load(fileName: '.env');
//   runApp(MyApp());
// }

main() => runApp(MyApp());

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
      builder: EasyLoading.init(),

      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => Welcome(),
        "/unitproduct": (BuildContext context) => UnitProduct(),
        "/orderresume": (context) => OrderResume(),
        "/orderdetails": (BuildContext context) => OrderDetails(),
        "/welcome": (context) => Welcome(),
        "/register":(context) => Register(),
        "/login":(context) => Login()
      },
    );
  }
}
