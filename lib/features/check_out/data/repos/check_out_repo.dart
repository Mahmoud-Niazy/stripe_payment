import 'package:dartz/dartz.dart';
import 'package:stripe_payment/features/check_out/data/models/payment_intent_input_model.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/utils/no_param.dart';

abstract class CheckoutRepo {
  Future<Either<Failure,NoParam>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
});
}