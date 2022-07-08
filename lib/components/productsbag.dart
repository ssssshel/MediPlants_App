// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyProductsBag extends StatefulWidget {
  MyProductsBag({Key? key}) : super(key: key);

  @override
  State<MyProductsBag> createState() => _MyProductsBagState();
}

class _MyProductsBagState extends State<MyProductsBag> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
      // Scrollable(viewportBuilder: viewportBuilder),

      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bolsa de compras",
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
Container cardItem(BuildContext context) {
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
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4.0)),
                    child: IconButton(
                      padding: EdgeInsets.only(right: 0),
                      iconSize: 15.0,
                      icon: (Icon(Icons.remove, color: Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4.0)),
                    child: IconButton(
                      padding: EdgeInsets.only(right: 0),
                      iconSize: 15.0,
                      icon: (Icon(Icons.add, color: Colors.white)),
                      onPressed: () {},
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

void _showOrderResume(BuildContext context) {
  Navigator.of(context).pushNamed("/orderresume");
}
