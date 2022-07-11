// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';
import '../components/carditem.dart';
import '../models/product.cart.dart';
import '../services/createorder.dart';

class OrderResume extends StatefulWidget {
  OrderResume({Key? key}) : super(key: key);

  @override
  State<OrderResume> createState() => _OrderResumeState();
}

class _OrderResumeState extends State<OrderResume> {
  // dynamic products = DatabaseHelper.instance.getProducts();
  String products = "ddd42";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context,
          isPrincipal: false,
          secondaryTitle: "Realizar Orden",
          isNotOrderResume: false),
      endDrawer: MyProductsBag(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resumen de orden",
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
                              child: Text("Tu carrito está vacio"),
                            )
                          : ListView(
                              children: snapshot.data!.map((product) {
                                return cardItem(context, product);
                              }).toList(),
                            );
                    })),
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
              onPressed: () async {
                await OrdersHelper.instance.createOrder(
                    Order(products: "fff", price: "fffff", email: "ffefefe"),
                    context);
              },
              color: Colors.cyan,
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                "Ir a pagar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}