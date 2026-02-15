import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/my_cart_body.dart';
import 'package:payment_app/core/shared_widgets/custom_appbar.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: const Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: CustomAppBar(
          title: 'My Cart',
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: MyCartBody(),
        ),
      ),
    );
  }
}
