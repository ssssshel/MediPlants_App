// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';

import '../mocks/products.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../models/product.cart.dart';

// Product product = Product();

class UnitProduct extends StatefulWidget {
  const UnitProduct({Key? key}) : super(key: key);

  @override
  State<UnitProduct> createState() => _UnitProductState();
}

const double kDefaultPadding = 15.0;
const kPrimaryColor = Color.fromARGB(255,203,227,100);
const kPrimaryLightColor = Color.fromARGB(90,43,144,84);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);

class _UnitProductState extends State<UnitProduct> {
  List productsMock = prodsMock;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final productArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;

    return Scaffold(
        appBar: MyAppBar(context,
            isPrincipal: false, secondaryTitle: productArguments[1]),
        endDrawer: MyProductsBag(),
        body: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 2),
            child: SizedBox(
              height: size.height * 0.55,
              child: Row(
                children: <Widget>[
                  Container(
                    height: size.height * 0.55,
                    width: size.width * 1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 60,
                          color: kPrimaryColor.withOpacity(0.29),
                        ),
                      ],
                    ),
                    child: Image.network(
                      productArguments[4],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TitleAndPrice(title: productArguments[1] , description: productArguments[2], price: productArguments[5]),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () async {
                  // AGREGAR VALIDACION DE PRODUCTO YA EXISTENTE
                  await DatabaseHelper.instance.add(
                    Product(
                        id: productArguments[0],
                        image: productArguments[4],
                        name: productArguments[1],
                        price: productArguments[5],
                        stock: productArguments[7]),
                  );
                  await EasyLoading.showSuccess('Producto agregado');
                },
                  child: Text(
                    "Agregar a la bolsa",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                ),
                child: Row(
                  children: [
                    RoundIconBtn(
                      iconData: Icons.remove,
                      color: Colors.black38,
                      press: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                    ),
                    RoundIconBtn(
                      iconData: Icons.add,
                      press: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      )   
    );
  }
}

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  final String title, description;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      
        children: <Widget>[
          Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child:
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "$title\n",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                 "S/. $price.00",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: kPrimaryColor),
              )
            ]
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child:
                Wrap(
                      children: <Widget>[
                      RichText(
                        softWrap: true,
                      text:  TextSpan(
                        text: description,
                        style: TextStyle(
                          fontSize: 14,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                      ),
                    ],
                ),
          )
        ],
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(kDefaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: kPrimaryColor.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Colors.white,
          ),
        ],
      ),
      child: Image.asset(icon),
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({
    Key? key,
    required this.iconData,
    this.color = kPrimaryColor,
    required this.press,
  }) : super(key: key);

  final IconData iconData;
  final Color color;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      onPressed: press,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}