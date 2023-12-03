import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_payment/core/functions/navigation.dart';
import 'package:stripe_payment/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:stripe_payment/features/check_out/data/repos/check_out_repo_imp.dart';
import 'package:stripe_payment/features/check_out/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:stripe_payment/features/check_out/presentation/manager/payment_cubit/payment_states.dart';
import 'package:stripe_payment/features/check_out/presentation/views/payment_receipt_view.dart';
import 'package:stripe_payment/features/check_out/presentation/views/widgets/payment_methods_list_view.dart';
import '../../../../../core/widgets/custom_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(CheckoutRepoImp()),
      child: Container(
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
            BlocConsumer<PaymentCubit, PaymentStates>(
              listener: (context, state) {
                if (state is PaymentSuccessfullyState) {
                  navigate(
                    context: context,
                    screen: const PaymentReceiptView(),
                  );
                }
                if (state is PaymentErrorState) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is PaymentLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return CustomButton(
                    label: 'Continue',
                    onPressed: () async {
                      PaymentIntentInputModel paymentIntentInputModel =
                          PaymentIntentInputModel(
                        currency: 'USD',
                        amount: '2000',
                            customerId: 'cus_P6s8W5tewBQQMn',
                      );
                      await PaymentCubit.get(context).makePayment(
                          paymentIntentInputModel: paymentIntentInputModel);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
//1.9.21