import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_payment/features/check_out/data/models/payment_intent_input_model.dart';
import 'package:stripe_payment/features/check_out/presentation/manager/payment_cubit/payment_states.dart';
import '../../../data/repos/check_out_repo.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  final CheckoutRepo checkoutRepo;

  PaymentCubit(this.checkoutRepo) : super(PaymentInitialState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoadingState());

    var data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    data.fold(
      (failure) => emit(PaymentErrorState(failure.error)),
      (success) => emit(PaymentSuccessfullyState()),
    );
  }
}
