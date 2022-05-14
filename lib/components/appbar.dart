import 'package:flutter/material.dart';

@override
<<<<<<< HEAD
AppBar myAppBar(context) {
=======
AppBar MyAppBar(context) {
>>>>>>> c6e37777be3712e31f69f2a4fc8a31b4c0f01913
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
