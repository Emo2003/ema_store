class ApiErrorModel {
  String? statusMsg;
  String? message;
  ApiErrorDetails? errors;

  ApiErrorModel({
    this.statusMsg,
    this.message,
    this.errors,
  });

  ApiErrorModel.fromJson(dynamic json) {
    if (json is! Map<String, dynamic>) {
      throw const FormatException('Invalid JSON');
    }

    statusMsg = json['statusMsg']?.toString();
    message = json['message']?.toString();

    if (json['errors'] is Map<String, dynamic>) {
      errors = ApiErrorDetails.fromJson(json['errors']);
    }
  }
}

class ApiErrorDetails {
  String? value;
  String? msg;
  String? param;
  String? location;

  ApiErrorDetails({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  factory ApiErrorDetails.fromJson(Map<String, dynamic> json) {
    return ApiErrorDetails(
      value: json['value']?.toString(),
      msg: json['msg']?.toString(),
      param: json['param']?.toString(),
      location: json['location']?.toString(),
    );
  }
}