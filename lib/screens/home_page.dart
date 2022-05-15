import 'package:flutter/material.dart';

import "../components/appbar.dart";
import "../components/bottombar.dart";
import '../components/productsbag.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.amber);
  }
}
