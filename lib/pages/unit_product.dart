// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';

import '../mocks/products.dart';

class UnitProduct extends StatefulWidget {
  const UnitProduct({Key? key}) : super(key: key);

  @override
  State<UnitProduct> createState() => _UnitProductState();
}

class _UnitProductState extends State<UnitProduct> {
  List productsMock = prodsMock;

  @override
  Widget build(BuildContext context) {
    final productArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
        appBar: MyAppBar(context,
            isPrincipal: false, secondaryTitle: productArguments[1]),
        endDrawer: MyProductsBag(),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          child: ListView(
            children: [
              Container(
                child: Image.network(
                  productArguments[4],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productArguments[1],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                        Text(
                          productArguments[2],
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          productArguments[3],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bolsa de 100 gramos"),
                        Text(
                          'S/. ${productArguments[5]}',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.green,
                child: Text("Agregar a la bolsa"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Propiedades",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(productArguments[6])
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
