import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/core/api_services/api_services.dart';
import 'package:stripe_payment/core/utils/payment_keys.dart';
import 'package:stripe_payment/features/check_out/data/models/ephemeral_key_model.dart';
import 'package:stripe_payment/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:stripe_payment/features/check_out/data/models/payment_intent_model.dart';

class StripeServices {
  ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await apiServices.postData(
      path: 'payment_intents',
      data: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: PaymentKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerId,
    required String ephemeralKey,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Mahmoud Elsolia',
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerId: customerId,
        customerEphemeralKeySecret: ephemeralKey ,
      ),
    );
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    EphemeralKeyModel ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKey: ephemeralKeyModel.ephemeralKey,
    );

    await presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
}) async{
    var response = await apiServices.postData(
      path: 'ephemeral_keys',
      data: {
        'customer' : customerId,
      },
      token: PaymentKeys.secretKey,
      headers: {
        'Authorization' : "Bearer ${PaymentKeys.secretKey}",
        'Stripe-Version' : "2023-10-16" ,
      },
    );

    EphemeralKeyModel ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }
}
