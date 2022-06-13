import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../entities/data_entity.dart';

class FetchUser {
  static final _client = http.Client();

  static final _createUserUrl =
      Uri.parse("https://mediplants-api.herokuapp.com/users");

  static Future createUser(name, surname, email, context) async {
    http.Response response = await _client.post(_createUserUrl, body: {
      "name": name,
      "surname": surname,
      "email": email,
      "role": "user",
      "orders": [""]
    });

    final _resJson = jsonDecode(response.body);
    var _userObject = DataEntity.fromjson(_resJson);
    if (response.statusCode == 201) {
      // await EasyLoading.showSuccess(
      //     "Successfull register: ${_userObject.message}");
    } else {
      await EasyLoading.showError("Error code: ${_userObject.message}");
    }
  }
}
