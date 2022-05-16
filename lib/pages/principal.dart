import 'package:flutter/material.dart';

import '../screens/home_page.dart';
import '../screens/products_menu.dart';
import '../screens/user_profile.dart';

import '../screens/products_menu_carlos.dart';
import '../components/productsbagkeiko.dart';

import "../components/appbar.dart";
import '../components/productsbag.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // final indexPage = ModalRoute.of(context)!.settings.arguments;

    // if (indexPage == "unitProduct") {
    //   setState(() {
    //     _selectedIndex = 1;
    //   });
    // }

    return Scaffold(
      appBar: MyAppBar(context),
      endDrawer: MyProductsBag(),
      body: PageView(
        children: [MyHomePage(), ProductsMenu(), UserProfile()],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_nature), label: "Menú"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Productos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Mi cuenta"),
        ],
        currentIndex: _selectedIndex,
        onTap: onTapped,
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
