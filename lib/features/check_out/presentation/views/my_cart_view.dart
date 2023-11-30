import 'package:flutter/material.dart';
import 'package:stripe_payment/core/utils/styles.dart';
import 'package:stripe_payment/core/widgets/custom_button.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/order_info_item.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/total_price_item.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: AppStyles.style25,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset('assets/images/basket_image.png'),
            ),
            const OrderInfoItem(
              title: 'Order Subtotal',
              value: '42.50',
            ),
            const OrderInfoItem(
              title: 'Discount',
              value: '0',
            ),
            const OrderInfoItem(
              title: 'Shipping',
              value: '8',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Divider(),
            ),
            const TotalPriceItem(
              price: '50.50',
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              child: CustomButton(
                label: 'Complete Payment',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const PaymentMethodsBottomSheet();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
