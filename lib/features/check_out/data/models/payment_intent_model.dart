class PaymentIntentModel {
  final String clientSecret;

  PaymentIntentModel({
    required this.clientSecret,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      clientSecret: json['client_secret'],
    );
  }
}
