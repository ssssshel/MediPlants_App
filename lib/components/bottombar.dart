import 'package:flutter/material.dart';

BottomNavigationBar MyBottomBar(context) {
  int _selectedIndex = 0;

  void onTapped(int index) {
    // showProductsMenu(context, index);
  }

  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.emoji_nature), label: "Menú"),
      BottomNavigationBarItem(icon: Icon(Icons.store), label: "Productos"),
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: "Mi cuenta"),
      BottomNavigationBarItem(
          icon: Icon(Icons.access_time), label: "Mis ordenes"),
    ],
    currentIndex: _selectedIndex,
    onTap: onTapped,
    selectedItemColor: Colors.lightGreen,
    unselectedItemColor: Colors.blue,
  );
}

// void showProductsMenu(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.of(context).pushNamed("/productsMenu");
//       break;
//     case 1:
//       Navigator.of(context).pushNamed("/");
//       break;
//     default:
//   }
// }
