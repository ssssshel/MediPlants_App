import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

// Future<Users>

class FetchUser {
  static final _client = http.Client();

  static var _registerUrl =
      Uri.parse("https://mediplants-api.herokuapp.com/users");

  static register(name, surname, email, password, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    });
    if (response.statusCode == 201) {
      var resJson = jsonDecode(response.body);
      await EasyLoading.showSuccess(
        "Success code: ${response.statusCode.toString()}"
      );
      // if (resJson[0] == true) {
      //   await EasyLoading.showSuccess(resJson[0]);

      // }else{
      //   EasyLoading.showError(resJson[0]);
      // }
    }else{
      await EasyLoading.showError(
        "Error code: ${response.statusCode.toString()}"
      );
    }
  }
}
