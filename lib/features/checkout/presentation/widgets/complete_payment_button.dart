// features/checkout/presentation/widgets/complete_payment_button.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/core/shared_widgets/custom_button.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/constants.dart';
import 'package:payment_app/features/checkout/data/models/paypal_models/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/paypal_models/item_list_model.dart';
import 'package:payment_app/features/checkout/data/models/paypal_models/transactions_model.dart';
import 'package:payment_app/features/checkout/data/models/stripe_models/payment_intent_request.dart';
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
            log('Current Index: $currentIndex', name: 'CompletePaymentButton');
            if (currentIndex == 0) {
              BlocProvider.of<StripePaymentCubit>(context).makePayment(
                paymentIntentInput: PaymentIntentRequest(
                  amount: 50,
                  currency: 'USD',
                ),
              );
              // Navigator.pushNamed(context, payWithCard);
            } else if (currentIndex == 1) {
              makePaypalPaymentProccess(context);
            }
          },
        );
      },
    );
  }

  void makePaypalPaymentProccess(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: ApiKeys.paypalClientId,
              secretKey: ApiKeys.paypalSecretKey,
              transactions: [getOrderDetails()],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, paymentSuccess);
              },
              onError: (error) {
                log("onError: $error");
                Navigator.pop(context);
              },
              onCancel: () {
                log('cancelled:');
                Navigator.pop(context);
              },
            ),
      ),
    );
  }

  Map getOrderDetails() {
    var details = DetailsModel(
      subtotal: '100',
      shipping: '0',
      shippingDiscount: 0,
    );
    var amount = AmountModel(total: "100", currency: "USD", details: details);
    List<ItemModel> items = [
      ItemModel(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      ItemModel(name: "Pineapple", quantity: 5, price: "12", currency: "USD"),
    ];
    var transactionsModel = TransactionsModel(
      amount: amount,
      description: 'The payment transaction description.',
      itemList: ItemListModel(items: items),
    );
    return transactionsModel.toMap();
  }
}
