// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, isPrincipal: false, secondaryTitle: "Orden N°"),
      endDrawer: MyProductsBag(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Orden N°",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            Text("Estado: Entregado"),
            Text("Fecha de pedido: "),
            Text("Cantidad de productos: 12"),
            _POCardItem(context),
            _POCardItem(context),
            _POCardItem(context),
            _POCardItem(context),
            _POCardItem(context),
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
          ],
        ),
      ),
    );
  }
}

Container _POCardItem(BuildContext context) {
  return Container(
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.grey[100],
          child: Center(
              child: Container(
            width: 70.0,
            height: 70.0,
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: Colors.grey[100],
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.vistafarma.com/blog/wp-content/uploads/2019/03/Propiedades-de-la-u%C3%B1a-de-gato.jpg")),
                borderRadius: BorderRadius.circular(20.0)),
          )),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 100.0,
                  child: Text(
                    "Uña de gato",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 4.0),

              // ALTERNADORES DE CANTIDAD
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Cantidad: 1",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "S/. 20.00",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
