import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mediplants_app/models/product.cart.dart';

class Order {
  final String products;
  final String price;
  final String email;

  Order({required this.products, required this.price, required this.email});
}

class OrdersHelper {
  OrdersHelper._privateConstructor();
  static final OrdersHelper instance = OrdersHelper._privateConstructor();

  Future createOrder(Order order, context) async {
    final url = Uri.parse("https://mediplants-api.herokuapp.com/orders");
    final response = await http.post(url, body: {
      'products': order.products,
      'price': order.price,
      'email': order.email
    });
    if (response.statusCode == 200) {
      await EasyLoading.showSuccess("Orden creada");
      Navigator.pushNamed(context, '/');
    } else {
      await EasyLoading.showError("Error");
    }
  }
}
