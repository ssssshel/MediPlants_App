class DataEntity {
  bool? success;
  bool? error;
  String? message = "";
  dynamic data;

  DataEntity({this.success, this.error, this.message, this.data});

  factory DataEntity.fromjson(Map<String, dynamic> json) {
    return DataEntity(
        success: json['success'],
        error: json['error'],
        message: json['message'],
        data: json['data']);
  }
}
