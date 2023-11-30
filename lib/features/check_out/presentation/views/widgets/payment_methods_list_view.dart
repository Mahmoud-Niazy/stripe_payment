import 'package:flutter/material.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  static List<String> paymentMethods = [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
  ];
  static int currentIndex = 0;

  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                PaymentMethodsListView.currentIndex = index ;
              });
            },
            child: PaymentMethodItem(
              image: PaymentMethodsListView.paymentMethods[index],
              isSelected:  PaymentMethodsListView.currentIndex == index ? true : false ,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 15,
          );
        },
        itemCount: PaymentMethodsListView.paymentMethods.length,
      ),
    );
  }
}
