// features/checkout/presentation/widgets/payment_methods_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/widgets/complete_payment_button.dart';
import 'package:payment_app/features/checkout/presentation/widgets/payment_methods_list_view.dart';

import '../../../../core/utils/app_stayles.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

int currentIndex = 0;

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Payment Methods', style: AppStyles.styleMedium25),
          const SizedBox(height: 40),
          PaymentMethodsListView(
            onTap: (index) {
              currentIndex = index;
            },
          ),
          const SizedBox(height: 40),
          CompletePaymentButton(currentIndex: currentIndex),
        ],
      ),
    );
  }
}
