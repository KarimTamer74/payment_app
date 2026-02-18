// features/checkout/presentation/cubits/stripe_payment_cubit/stripe_payment_cubit.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/data/models/stripe_models/payment_intent_request.dart';
import 'package:payment_app/features/checkout/data/repos/stripe_payment_repo.dart';
import 'package:payment_app/features/checkout/data/repos/stripe_payment_repo_impl.dart';
import 'package:payment_app/features/checkout/presentation/cubits/stripe_payment_cubit/stripe_payment_states.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit() : super(StripePaymentInitial());
  final StripePaymentRepo _paymentRepo = StripePaymentRepoImpl();
  Future<void> makePayment({
    required PaymentIntentRequest paymentIntentInput,
  }) async {
    emit(StripePaymentLoading());
    final result = await _paymentRepo.makePayement(body: paymentIntentInput);
    result.fold(
      (failure) {
        log(
          "Payment failed with error: ${failure.message}",
          name: "StripePaymentCubit.makePayment",
        );
        emit(StripePaymentFailure(message: failure.message));
      },

      (_) {
        log("Payment successful", name: "StripePaymentCubit.makePayment");
        emit(StripePaymentSuccess());
      },
    );
  }
}
