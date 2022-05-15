import "package:flutter/material.dart";

import '../components/appbar.dart';
import '../components/bottombar.dart';
import '../components/productsbag.dart';

class ProductsMenu extends StatefulWidget {
  ProductsMenu({Key? key}) : super(key: key);

  @override
  State<ProductsMenu> createState() => _ProductsMenuState();
}

class _ProductsMenuState extends State<ProductsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Card(
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  child: GestureDetector(
                      onTap: () {
                        _showUnitProductMenu(context);
                        Colors.amber;
                      },
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.symmetric(vertical: 20),
                            // margin: EdgeInsets.all(15),
                            child: Image.network(
                              "https://static.inaturalist.org/photos/37321715/large.jpg",
                              fit: BoxFit.cover,
                              height: 250,
                              width: 450,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10)),
                                  Text("Abuta", style: TextStyle(fontSize: 18)),
                                  Text('Analgésico'),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    child: Text("Ver detalles"),
                                  ))
                            ],
                          )
                        ],
                      )),
                )
              ],
            ));
      }),
    );
  }
}

void _showUnitProductMenu(BuildContext context) {
  Navigator.of(context).pushNamed("/unitproduct");
}
