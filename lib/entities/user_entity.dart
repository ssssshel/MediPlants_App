class UserEntity {
  int id = 0;
  String name = "";
  String email = "";

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserEntity.fromjson(Map<String, dynamic> json) {
    return UserEntity(id: json['id'], name: json['name'], email: json['email']);
  }
}
