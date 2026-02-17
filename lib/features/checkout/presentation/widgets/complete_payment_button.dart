// features/checkout/presentation/widgets/complete_payment_button.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/shared_widgets/custom_button.dart';
import 'package:payment_app/core/utils/constants.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment_app/features/checkout/presentation/cubits/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/cubits/stripe_payment_cubit/stripe_payment_states.dart';

class CompletePaymentButton extends StatelessWidget {
  const CompletePaymentButton({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          log('Payment Successfull', name: 'PaymentMethodsBottomSheet');
          Navigator.pushReplacementNamed(context, paymentSuccess);
        } else if (state is StripePaymentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          textButton:
              state is StripePaymentLoading
                  ? 'Please wait...'
                  : 'Complete Payment',
          onPressed: () {
            if (currentIndex == 0) {
              BlocProvider.of<StripePaymentCubit>(context).makePayment(
                paymentIntentInput: PaymentIntentRequest(
                  amount: 50,
                  currency: 'USD',
                ),
              );
              // Navigator.pushNamed(context, payWithCard);
            } else if (currentIndex == 1) {
              Navigator.pushNamed(context, paymentSuccess);
            }
          },
        );
      },
    );
  }
}
