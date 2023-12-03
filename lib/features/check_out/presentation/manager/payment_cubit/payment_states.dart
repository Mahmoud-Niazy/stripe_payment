abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates{}

class PaymentLoadingState extends PaymentStates{}
class PaymentSuccessfullyState extends PaymentStates{}
class PaymentErrorState extends PaymentStates{
  final String error;
  PaymentErrorState(this.error);
}