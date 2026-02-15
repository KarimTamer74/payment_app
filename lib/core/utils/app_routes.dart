import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/constants.dart';
import 'package:payment_app/features/checkout/presentation/views/pay_with_card_view.dart';
import 'package:payment_app/features/checkout/presentation/views/pay_with_paypal_view.dart';
import 'package:payment_app/features/checkout/presentation/views/payment_details_view.dart';
import 'package:payment_app/features/checkout/presentation/views/successful_payment_view.dart';

class AppRoutes {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case paymentDetails:
        return MaterialPageRoute(
          builder: (context) => const PaymentDetailsView(),
        );
      case paymentSuccess:
        return MaterialPageRoute(
          builder: (context) => const SuccessfulPaymentView(),
        );
      case payWithCard:
        return MaterialPageRoute(
          builder: (context) => const PayWithCardView(),
        );
      case payWithPayPal:
        return MaterialPageRoute(
          builder: (context) => const PayWithPaypalView(),
        );
      default:
        return null;
    }
  }
}
