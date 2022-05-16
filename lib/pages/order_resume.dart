import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';

class OrderResume extends StatefulWidget {
  OrderResume({Key? key}) : super(key: key);

  @override
  State<OrderResume> createState() => _OrderResumeState();
}

class _OrderResumeState extends State<OrderResume> {
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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Resumen de orden",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            cardItem(context),
            cardItem(context),
            cardItem(context),
            cardItem(context),
            cardItem(context),
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
              onPressed: () {},
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
