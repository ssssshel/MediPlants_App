import 'dart:convert';

import 'package:culqi_flutter/culqi_flutter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Culqi{

  TextEditingController email = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController expirationM = TextEditingController();
  TextEditingController expirationY = TextEditingController();
  TextEditingController cvv = TextEditingController();

  static final _client = http.Client();
  static var _registerUrl = Uri.parse("https://api.culqi.com/v2/charges");

  void Pagos(context) async {

    CCard card = CCard(
      cardNumber: cardnumber.text,
      expirationMonth: 09,
      expirationYear: 20,
      cvv: cvv.text,
      email: email.text
    );

    try{
        CToken token = await createToken(card: card, apiKey: "sk_test_UTCQSGcXW8bCyU59");
        //su token
        print(token.id);

        Map<String, String> requestHeaders = {"Content-type": "application/json", "Accept": "application/json", "authorization": "Bearer pk_test_vzMuTHoueOMlgUPj" };

        http.Response response = await _client.post(_registerUrl, body: {
          "amount": 1000,
          "currency_code": "PEN",
          "email": "TEST@CULQI",
          "source_id": token.id
        }, headers: requestHeaders);

        if (response.statusCode == 200) {
          String responsebody = response.body;

          showDialog(
          context: context, 
          builder: (context){
              return AlertDialog(
                title: Text("Alerta"),
                content: Text(responsebody.toString()),
              );
          });
        } else {
          throw Exception('Failed to load data!');
        }

    } on CulqiBadRequestException catch(ex){
        print(ex.cause);
    } on CulqiUnknownException catch(ex){
        //codigo de error del servidor
        print(ex.cause);
    }

    

  }


}