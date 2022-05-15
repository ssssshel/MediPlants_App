import 'package:flutter/material.dart';

import '../pages/principal.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';

class UnitProduct extends StatefulWidget {
  UnitProduct({Key? key}) : super(key: key);

  @override
  State<UnitProduct> createState() => _UnitProductState();
}

class _UnitProductState extends State<UnitProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text("product"),
    ));
  }
}
