import 'package:flutter/material.dart';
import 'package:payment_app/core/shared_widgets/custom_button.dart';
import 'package:payment_app/core/shared_widgets/custom_divider.dart';
import 'package:payment_app/core/utils/app_stayles.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/order_info_section.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('assets/images/products.png')),
        const SizedBox(
          height: 25,
        ),
        const OrderInfoSection(),
        const SizedBox(
          height: 8,
        ),
        const CustomDivider(indent: 15, endIndent: 15),
        const SizedBox(
          height: 12,
        ),
        OrderInfoItem(
          title: 'Total',
          value: '\$50.97',
          style: AppStyles.styleSemiBold24,
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          textButton: 'Complete Payment',
          onPressed: () {
            // Navigator.pushNamed(context, paymentDetails);
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const PaymentMethodsBottomSheet();
                });
          },
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
