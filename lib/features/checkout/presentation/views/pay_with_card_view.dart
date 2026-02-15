import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_details_body.dart';

class PayWithCardView extends StatelessWidget {
  const PayWithCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const PaymentDetailsBody());
  }
}
