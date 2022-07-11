import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Product {
  final int id;
  final String name;
  final String image;
  final int price;
  final int stock;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.stock});

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        stock: json['stock'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'stock': stock,
      };
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "products.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE products(
    id INTEGER,
    name TEXT,
    image TEXT,
    price INTEGER,
    stock INTEGER
  )
''');
  }

  Future<List<Product>> getProducts() async {
    Database db = await instance.database;
    var products = await db.query('products', orderBy: 'id');
    List<Product> productList = products.isNotEmpty
        ? products.map((e) => Product.fromMap(e)).toList()
        : [];

    return productList;
  }

  Future<int> add(Product product) async {
    Database db = await instance.database;
    return await db.insert('products', product.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
