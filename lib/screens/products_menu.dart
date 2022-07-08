// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

import '../mocks/products.dart';
import '../services/fetchProducts.dart';
import '../models/products.dart';

class ProductsMenu extends StatefulWidget {
  ProductsMenu({Key? key}) : super(key: key);

  @override
  State<ProductsMenu> createState() => _ProductsMenuState();
}

List<ProductsModel>? products;

final _client = http.Client();
final _fetchProductsUrl =
    Uri.parse("https://mediplants-api.herokuapp.com/products");

Future<void> getProducts() async {
  http.Response response = await _client.get(_fetchProductsUrl);

  if (response.statusCode == 200) {
    List jsonData = jsonDecode(response.body);
    jsonData
        .map((dynamic json) => products?.add(ProductsModel.fromjson(json)))
        .toList();
  } else {
    throw Exception("fallo el llamado al API");
  }
}

class _ProductsMenuState extends State<ProductsMenu> {
  List productsMock = prodsMock;
  // final productsMock = ProductsModel().products;
  // final Future<ProductsModel> products = getProducts();
  // late List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: products?.length,
          itemBuilder: (BuildContext context, int index) {
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
                                  // ProductsModel().img,
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
