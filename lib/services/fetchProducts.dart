import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:mediplants_app/entities/data_entity.dart';
import '../models/products.dart';

class FetchProducts {
  // List? products;
  // String? message = "";
  late List<ProductsModel> products;

  // FetchProducts({this.products, this.message});

  static final _client = http.Client();
  static final _fetchProductsUrl =
      Uri.parse("https://mediplants-api.herokuapp.com/products");

  Future<void> getProducts() async {
    http.Response response = await _client.get(_fetchProductsUrl);

    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      jsonData
          .map((dynamic json) => products.add(ProductsModel.fromjson(json)))
          .toList();
    } else {
      throw Exception("fallo el llamado al API");
    }
  }
}
