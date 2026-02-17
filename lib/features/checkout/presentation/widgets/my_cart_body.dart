// features/checkout/presentation/widgets/my_cart_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/shared_widgets/custom_button.dart';
import 'package:payment_app/core/shared_widgets/custom_divider.dart';
import 'package:payment_app/core/utils/app_stayles.dart';
import 'package:payment_app/features/checkout/presentation/cubits/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/widgets/order_info_item.dart';
import 'package:payment_app/features/checkout/presentation/widgets/order_info_section.dart';
import 'package:payment_app/features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('assets/images/products.png')),
        const SizedBox(height: 25),
        const OrderInfoSection(),
        const SizedBox(height: 8),
        const CustomDivider(indent: 15, endIndent: 15),
        const SizedBox(height: 12),
        OrderInfoItem(
          title: 'Total',
          value: '\$50.97',
          style: AppStyles.styleSemiBold24,
        ),
        const SizedBox(height: 16),
        CustomButton(
          textButton: 'Complete Payment',
          onPressed: () async {
            // Navigator.pushNamed(context, paymentDetails);

            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => StripePaymentCubit(),
                  child: const PaymentMethodsBottomSheet(),
                );
              },
            );
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
