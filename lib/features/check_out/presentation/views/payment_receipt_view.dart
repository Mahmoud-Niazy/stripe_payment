import 'package:flutter/material.dart';
import 'package:stripe_payment/core/utils/styles.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/bar_code.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/check_circle.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/credit_card.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/dashed_line.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/payment_receipt_info_item.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/total_price_item.dart';

class PaymentReceiptView extends StatelessWidget {
  const PaymentReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Transform.translate(
        offset: const Offset(0, -15),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0XFFEDEDED),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50 + 15,
                  left: 23,
                  right: 23,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Thank You',
                      style: AppStyles.style25,
                    ),
                    Text(
                      'Your transaction was success',
                      style: AppStyles.style20.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const PaymentReceiptInfoItem(
                      title: 'Date',
                      value: '30/11/2023',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PaymentReceiptInfoItem(
                      title: 'Time',
                      value: '10:30 AM',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const PaymentReceiptInfoItem(
                      title: 'To',
                      value: 'Mahmoud Elsolia',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 40,
                    ),
                    const TotalPriceItem(
                      price: '50.50',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CreditCard(),
                  ],
                ),
              ),
              const CheckCircle(),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .2,
                left: -20,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * .2,
                right: -20,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
              const DashedLine(),
              const BarCode(),
            ],
          ),
        ),
      ),
    );
  }
}
