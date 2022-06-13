// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import "package:flutter/material.dart";

import '../mocks/products.dart';

class ProductsMenu extends StatelessWidget {
  ProductsMenu({Key? key}) : super(key: key);

  List productsMock = prodsMock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: productsMock.length,
          itemBuilder: (BuildContext context, int index) {
            // final product = products[index];
            return Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 310,
                      child: GestureDetector(
                          onTap: () {
                            _showUnitProductMenu(context, index);
                          },
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(
                                  productsMock[index]['img'],
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: 450,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(productsMock[index]['name'],
                                            style: TextStyle(fontSize: 18)),
                                        Text(productsMock[index]['category']),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          _showUnitProductMenu(context, index);
                                        },
                                        child: Text("Ver opciones"))
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ));
          }),
    );
  }
}

void _showUnitProductMenu(BuildContext context, int index) {
  Navigator.of(context).pushNamed("/unitproduct", arguments: index);
}
