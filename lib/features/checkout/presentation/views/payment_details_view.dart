import 'package:flutter/material.dart';
import 'package:payment_app/core/shared_widgets/custom_appbar.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(title: 'Payment Methods'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: PaymentDetailsBody(),
      ),
    );
  }
}
