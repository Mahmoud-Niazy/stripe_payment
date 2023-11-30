import 'package:flutter/material.dart';
import 'package:stripe_payment/features/check_out/presentation/views/my_cart_view.dart';

void main() {
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