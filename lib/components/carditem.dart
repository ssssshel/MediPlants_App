// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/product.cart.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Container cardItem(BuildContext context, Product product) {
  final route = ModalRoute.of(context)!.settings.name;

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
                image: DecorationImage(image: NetworkImage(product.image)),
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
                    product.name,
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
                  IconButton(
                      onPressed: () async {
                        DatabaseHelper.instance.remove(product.id);
                        await EasyLoading.showSuccess('Producto eliminado');
                        if (route != null) {
                          Navigator.pushNamed(context, route);
                        }
                      },
                      icon: Icon(Icons.delete)),
                  Text(
                    'S/. ${product.price}',
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
