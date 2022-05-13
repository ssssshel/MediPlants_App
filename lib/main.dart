import 'package:flutter/material.dart';

import 'components/appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediPlants',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),

      endDrawer: Drawer(),

      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.store), label: "Productos"),
        BottomNavigationBarItem(icon: Icon(Icons.emoji_nature), label: "Menú"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Mi cuenta"),
      ]),
    );
  }
}
