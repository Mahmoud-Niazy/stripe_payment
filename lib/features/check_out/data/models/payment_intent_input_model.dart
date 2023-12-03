class PaymentIntentInputModel{
  final String amount;
  final String currency;
  final String customerId ;

  PaymentIntentInputModel({
    required this.currency,
    required this.amount,
    required this.customerId,
});

  toJson(){
    return {
      'amount' : amount,
      'currency' : currency,
      'customer' : customerId,
    };
  }
}