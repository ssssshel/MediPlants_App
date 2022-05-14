import 'package:flutter/material.dart';

@override
Drawer MyProductsBag(context) {
  return Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Bolsa de compras", style: TextStyle(fontSize: 18)),
      ],
    ),
  );
}
