import 'package:flutter/material.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/payment_methods_list_view.dart';

import '../../../../../core/widgets/custom_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget{
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethodsListView(),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            label: 'Continue',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}