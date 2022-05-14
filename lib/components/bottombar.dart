import 'package:flutter/material.dart';

@override
BottomNavigationBar MyBottomBar(context) {
  return BottomNavigationBar(items: const [
    BottomNavigationBarItem(icon: Icon(Icons.store), label: "Productos"),
    BottomNavigationBarItem(icon: Icon(Icons.emoji_nature), label: "Menú"),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: "Mi cuenta"),
  ]);
}
