import 'package:flutter/material.dart';
import 'package:payment_app/core/shared_widgets/custom_appbar.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/succesful_payment_view_body.dart';

class SuccessfulPaymentView extends StatelessWidget {
  const SuccessfulPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(title: ''),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
          child: SuccessfulPaymentViewBody(),
        ),
      ),
    );
  }
}
