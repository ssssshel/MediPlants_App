// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

import '../mocks/products.dart';
import '../services/fetchProducts.dart';
import '../models/products.dart';

class ProductsMenu extends StatefulWidget {
  ProductsMenu({Key? key}) : super(key: key);

  @override
  State<ProductsMenu> createState() => _ProductsMenuState();
}

List<ProductsModel>? products;

final _client = http.Client();
final _fetchProductsUrl =
    Uri.parse("https://mediplants-api.herokuapp.com/products");

const double kDefaultPadding = 15.0;
const kPrimaryColor = Color.fromARGB(255,43,144,84);
const kPrimaryLightColor = Color.fromARGB(90,43,144,84);

Future<void> getProducts() async {
  http.Response response = await _client.get(_fetchProductsUrl);

  if (response.statusCode == 200) {
    List jsonData = jsonDecode(response.body);
    jsonData
        .map((dynamic json) => products?.add(ProductsModel.fromjson(json)))
        .toList();
  } else {
    throw Exception("fallo el llamado al API");
  }
}

class _ProductsMenuState extends State<ProductsMenu> {
  List productsMock = prodsMock;
  // final productsMock = ProductsModel().products;
  // final Future<ProductsModel> products = getProducts();
  // late List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const headerHeight = 85.0;
    const defaultPadding = 20.0;
    const cartBarHeight = 1.0;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom:false,
        child: Container(
          color: Color(0xFFEAEAEA),
          child: LayoutBuilder(
            builder:(context, BoxConstraints constraints) {
            return Stack(
            children: [ 
              Positioned(
                top: 10,
                right: 0,
                left: 0,
                height: constraints.maxHeight - 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: productsMock.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: defaultPadding,
                      crossAxisSpacing: defaultPadding
                    ), 
                    itemBuilder: (BuildContext context, int index) {
                      final String title = productsMock[index]['name'];
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: defaultPadding/6),
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(defaultPadding),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container( // Border width
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(60), // Image radius
                                    child: Image.network(productsMock[index]['img'], fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Text(
                                title.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontWeight: FontWeight.w600, color: kPrimaryColor),
                              ),
                              Text(
                                productsMock[index]['category'].toUpperCase(),
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Row(
                                children: [
                                  Price(amount: productsMock[index]['price']),
                                  Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      _showUnitProductMenu(context, index);
                                    },
                                  child: Text("ver")),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              )
            ]
          );
          }
        )
       )
      )
    );
  }
}

void _showUnitProductMenu(BuildContext context, int index) {
  Navigator.of(context).pushNamed("/unitproduct", arguments: index);
}


class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.amount,
  }) : super(key: key);
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "S/. ",
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.w600, color: kPrimaryColor),
        children: [
          TextSpan(
            text: amount.toString(),
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}

class FavBtn extends StatelessWidget {
  const FavBtn({
    Key? key,
    this.radius = 12,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xFFE3E2E3),
      child: Image.asset("assets/heart.png"),
    );
  }
}