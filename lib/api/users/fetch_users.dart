import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../entities/info_entity.dart';

// CREATE NEW USER
class FetchUser {
  static final _client = http.Client();

  static final _registerUrl =
      Uri.parse("https://mediplants-api.herokuapp.com/users");

  static register(name, surname, email, password, context) async {
    http.Response response = await _client.post(_registerUrl, body: {
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    });

    final _resJson = jsonDecode(response.body);
    final _userObject = InfoEntity.fromjson(_resJson);
    if (response.statusCode == 201) {
      await EasyLoading.showSuccess(
          "Successfull register: ${_userObject.message}");
      Navigator.pushNamed(context, '/login');
    } else {
      await EasyLoading.showError("Error code: ${_userObject.message}");
    }
  }

  static login(email, password, context) async {}
}
