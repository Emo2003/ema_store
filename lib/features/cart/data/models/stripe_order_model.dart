class StripeCheckoutModel {
  final String? status;
  final String? message;
  final String? sessionUrl;

  StripeCheckoutModel({
    this.status,
    this.message,
    this.sessionUrl,
  });

  factory StripeCheckoutModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return StripeCheckoutModel(
      status: json['status'],
      message: json['message'],
      sessionUrl: json['session']?['url'],
    );
  }
}