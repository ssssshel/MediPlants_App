class ProductsModel {
  String? name;
  String? scname;
  String? category;
  String? img;
  int? price;
  String? information;
  int? stock;

  ProductsModel({
    this.name,
    this.scname,
    this.category,
    this.img,
    this.price,
    this.information,
    this.stock,
  });

  // String get Name => name;
  // String get Scname => scname;
  // String get Category => category;
  // String get Img => img;
  // int get Price => price;
  // String get Information => information;
  // int get Stock => stock;

  set setName(String value) => name = value;
  set setScname(String value) => scname = value;
  set setCategory(String value) => category = value;
  set setImg(String value) => img = value;
  set setPrice(int value) => price = value;
  set setInformation(String value) => information = value;
  set setStock(int value) => stock = value;

  factory ProductsModel.fromjson(Map<String, dynamic> json) {
    return ProductsModel(
      name: json['name'],
      scname: json['scname'],
      category: json['category'],
      img: json['img'],
      price: json['price'],
      information: json['information'],
      stock: json['stock'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'scname': scname,
      'category': category,
      'img': img,
      'price': price,
      'information': information,
      'stock': stock,
    };
  }
  // List products;
  // ProductsModel({required this.products});
  // factory ProductsModel.fromjson(List json) {
  //   return ProductsModel(products: json);
  // }
}
