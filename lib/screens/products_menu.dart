import "package:flutter/material.dart";

class ProductsMenu extends StatefulWidget {
  ProductsMenu({Key? key}) : super(key: key);

  @override
  State<ProductsMenu> createState() => _ProductsMenuState();
}

class _ProductsMenuState extends State<ProductsMenu> {
  List products = [
    {
      "name": "Abuta",
      "type": "Analgésico",
      "img": "https://static.inaturalist.org/photos/37321715/large.jpg"
    },
    {
      "name": "Ajo sacha",
      "type": "Antiglucémico",
      "img":
          "https://delamazonas.com/wp-content/uploads/2021/05/Garlic-Vine-Mansoa-alliacea-aka-Ajos-Sacha-in-Kerala-low.jpg"
    },
    {
      "name": "Copaiba",
      "type": "Cicatrizante",
      "img":
          "https://www.pebani.com.pe/wp-content/uploads/2018/05/Copaiba_frutos1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.only(top: 20),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            // final product = products[index];
            return Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 310,
                      child: GestureDetector(
                          onTap: () {
                            _showUnitProductMenu(context);
                          },
                          child: Column(
                            children: [
                              Container(
                                child: Image.network(
                                  "https://static.inaturalist.org/photos/37321715/large.jpg",
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: 450,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Abuta",
                                            style: TextStyle(fontSize: 18)),
                                        Text('Analgésico'),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          _showUnitProductMenu(context);
                                        },
                                        child: Text("Ver opciones"))
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ));
          }),
    );
  }
}

void _showUnitProductMenu(BuildContext context) {
  Navigator.of(context).pushNamed("/unitproduct");
}
