class InfoEntity {
  bool? success;
  bool? error;
  String? message = "";

  InfoEntity({this.success, this.error, this.message});

  factory InfoEntity.fromjson(Map<String, dynamic> json) {
    return InfoEntity(
        success: json['success'],
        error: json['error'],
        message: json['message']);
  }
}
