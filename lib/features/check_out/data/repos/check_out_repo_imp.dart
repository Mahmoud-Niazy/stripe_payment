import 'package:dartz/dartz.dart';
import 'package:stripe_payment/core/failure/failure.dart';
import 'package:stripe_payment/core/stripe_services/stripe_services.dart';
import 'package:stripe_payment/core/utils/no_param.dart';
import 'package:stripe_payment/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:stripe_payment/features/check_out/data/repos/check_out_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  StripeServices stripeServices = StripeServices();
  @override
  Future<Either<Failure, NoParam>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async{
    try{
      await stripeServices.makePayment(paymentIntentInputModel: paymentIntentInputModel);
      return right(NoParam());
    }
    catch(error){
      return left(Failure(error.toString()));
    }
  }
}
