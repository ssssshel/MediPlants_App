// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import './carditem.dart';
import '../models/product.cart.dart';

class MyProductsBag extends StatefulWidget {
  MyProductsBag({Key? key}) : super(key: key);

  @override
  State<MyProductsBag> createState() => _MyProductsBagState();
}

class _MyProductsBagState extends State<MyProductsBag> {
  int getSubtotal(List<Product> products) {
    var sumaprice = 0;

    products.forEach((element) {
      sumaprice += element.price as int;
    });
    return sumaprice;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
      // Scrollable(viewportBuilder: viewportBuilder),

      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bolsa de compras",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: DatabaseHelper.instance.getProducts(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Product>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('Cargando'),
                  );
                }
                return snapshot.data!.isEmpty
                    ? Center(
                        child: Text("Tu bolsa está vacía"),
                      )
                    : ListView(
                        children: snapshot.data!.map((product) {
                          return cardItem(context, product);
                        }).toList(),
                      );
              },
            ),
          ),
          SizedBox(height: 21.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              Text(
                "S/. 60.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Costo delivery",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "S/. 10.00",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              Text(
                "S/. 70.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ],
          ),
          SizedBox(height: 50),
          MaterialButton(
            onPressed: () => _showOrderResume(context),
            color: Colors.cyan,
            height: 50.0,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Text(
              "Realizar compra",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }
}

@override
void _showOrderResume(BuildContext context) {
  Navigator.of(context).pushNamed("/orderresume");
}
