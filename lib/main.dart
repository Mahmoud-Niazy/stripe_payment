import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/core/api_services/api_services.dart';
import 'package:stripe_payment/core/utils/payment_keys.dart';
import 'package:stripe_payment/features/check_out/presentation/views/my_cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = PaymentKeys.publishableKey;
  await ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCartView(),
      debugShowCheckedModeBanner: false,
    );
  }
}