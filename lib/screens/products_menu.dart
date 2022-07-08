// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class ProductsMenu extends StatefulWidget {
  ProductsMenu({Key? key}) : super(key: key);

  @override
  State<ProductsMenu> createState() => _ProductsMenuState();
}

class _ProductsMenuState extends State<ProductsMenu> {
  List<dynamic> items = [];
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future fetch() async {
    final url = Uri.parse("https://mediplants-api.herokuapp.com/products");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        if (newItems.length < 10) {
          hasMore = false;
        }
        items.addAll(newItems.map<List<dynamic>>((item) {
          // final id = item['id'];
          // return "Item $id";
          final id = item['id'];
          final name = item['name'];
          final scname = item['scname'];
          final category = item['category'];
          final img = item['img'];
          final price = item['price'];
          final information = item['information'];
          final stock = item['stock'];
          return [id, name, scname, category, img, price, information, stock];
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: items.length,
          itemBuilder: (context, index) {
            if (index <= items.length) {
              final item = items[index];

              return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 310,
                        child: GestureDetector(
                            onTap: () {
                              _showUnitProductMenu(context, item);
                            },
                            child: Column(
                              children: [
                                Container(
                                  child: Image.network(
                                    item[4],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(item[1],
                                              style: TextStyle(fontSize: 18)),
                                          Text(item[3]),
                                        ],
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            _showUnitProductMenu(context, item);
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
            } else {
              return Text("No hay más productos");
            }
          }),
    );
  }
}

void _showUnitProductMenu(BuildContext context, List<dynamic> item) {
  Navigator.of(context).pushNamed("/unitproduct", arguments: item);
}
