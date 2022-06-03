class User {
  int id = 0;
  String name = "";
  String email = "";

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromjson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }
}
