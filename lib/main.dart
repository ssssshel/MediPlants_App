// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mediplants_app/services/auth.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'pages/welcome.dart';
import 'pages/register.dart';
import 'pages/login.dart';
import 'pages/principal.dart';
import 'pages/unit_product.dart';
import 'pages/order_resume.dart';
import 'pages/order_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService.instance(),
      child: MaterialApp(
        title: 'MediPlants',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        home: Consumer(
          builder: (context, AuthService authService, _) {
            switch (authService.status) {
              case AuthStatus.Unitialized:
                // return Center(
                //   child: Text("Loading..."),
                // );
                return Welcome();
              case AuthStatus.Unauthenticated:
                return Welcome();
              case AuthStatus.Authenticating:
                return Login();
              case AuthStatus.Authenticated:
                return PrincipalPage();
              default:
                return Text("Error");
            }
          },
        ),
        routes: {
          // "/": (BuildContext context) => Welcome(),
          "/unitproduct": (BuildContext context) => UnitProduct(),
          "/orderresume": (context) => OrderResume(),
          "/orderdetails": (BuildContext context) => OrderDetails(),
          "/welcome": (context) => Welcome(),
          "/register": (context) => Register(),
          "/login": (context) => Login()
        },
      ),
    );
  }
}
