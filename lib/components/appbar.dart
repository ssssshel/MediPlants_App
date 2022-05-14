import 'package:flutter/material.dart';

@override
AppBar MyAppBar(context) {
  return AppBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: const Text("MediPlants"),
    actions: [
      Builder(builder: (context) {
        return IconButton(
          onPressed: () => Scaffold.of(context).openEndDrawer(),
          icon: const Icon(Icons.shopping_bag),
        );
      })
    ],
  );
}
