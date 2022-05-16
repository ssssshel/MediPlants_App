import 'dart:convert';
import 'dart:io';

import 'package:postgres/postgres.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

void connectDB(List<String> arguments) async {
  final connection = PostgreSQLConnection("34.176.102.74", 5432, "bd-certus",
      username: "postgres", password: "Alstroemeriaaurea15");

  try {
    await connection.open();
    print("Conexión con la DB exitosa");

    // CREAR TABLA
    // await connection.query('''
    // CREATE TABLE products(
    //   id serial primary key not null,
    //   name text,
    //   scName text,
    //   category text,
    //   img text,
    //   prize integer,
    //   information text
    // )
    // ''');

    // CREAR DATA
    // await connection.query('''
    //         INSERT INTO products (name, scName, category, img, prize, information)
    //         VALUES ('Abuta','Abutaz grandifolia','Analgésico','https://static.inaturalist.org/photos/37321715/  large.jpg',8,'Analgésico dental.')
    //         RETURNING *
    //       ''');

    // LEER DATA
    // var res = await connection.query('SELECT * from products');
    // print(res);

    // ELIMINAR DATA
    // await connection.query('''DELETE FROM products WHERE id > 1''');

    // AÑADIR DATA (ARRAYS)
    // final mockupString = await File('./demo.json').readAsString();
    // final mockupData = jsonDecode(mockupString);
    // final mockupDataStream = Stream.fromIterable(mockupData);

    // await for (var row in mockupDataStream) {
    //   await connection
    //       .query('''INSERT INTO products (name, scName, category, img, prize, information)
    //         VALUES (@name,@scName,@category,@img,@prize,@information)
    //   ''', substitutionValues: {
    //     'name': row['name'],
    //     'scName': row['scName'],
    //     'category': row['category'],
    //     'img': row['img'],
    //     'prize': row['prize'],
    //     'information': row['information'],
    //   });
    // }

    // RESULTS MAP

    List<Map<String, Map<String, dynamic>>> resultsMap =
        await connection.mappedResultsQuery('''SELECT * FROM products''');

    await connection.close();
  } catch (error) {
    print(error);
  }
}
