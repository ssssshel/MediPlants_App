import 'package:flutter/material.dart';

import '../pages/principal.dart';

import '../components/appbar.dart';
import '../components/productsbag.dart';

class UnitProduct extends StatefulWidget {
  UnitProduct({Key? key}) : super(key: key);

  @override
  State<UnitProduct> createState() => _UnitProductState();
}

class _UnitProductState extends State<UnitProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(context,
            isPrincipal: false, secondaryTitle: "Product name"),
        endDrawer: MyProductsBag(),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
          child: ListView(
            children: [
              Container(
                child: Image.network(
                    "https://static.inaturalist.org/photos/37321715/large.jpg"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Abuta",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal)),
                        Text(
                          "Nombre científico",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Antinflamatorio",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Bolsa de 100 gramos"),
                        Text(
                          "S/. 12",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.green,
                child: Text("Agregar a la bolsa"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Propiedades",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                        "Analgésico dental, tónico cerebral, anemia, colesterol, cólico menstrual, diabetes, dismenorrea, esterilidad femenina, fiebre, hemorragia post-menstrual y post operatoria, paludismo, reumatismo, tifoidea, ulceras estomacales.")
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
