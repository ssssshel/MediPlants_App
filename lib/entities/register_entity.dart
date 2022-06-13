class RegisterEntity {
  bool? success;
  bool? error;
  String? message = "";

  RegisterEntity({this.success, this.error, this.message});

  factory RegisterEntity.fromjson(Map<String, dynamic> json) {
    return RegisterEntity(
        success: json['success'],
        error: json['error'],
        message: json['message']);
  }
}
