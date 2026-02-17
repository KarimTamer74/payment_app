// features/checkout/presentation/widgets/succesful_payment_view_body.dart
import 'package:flutter/material.dart';
import 'package:payment_app/core/shared_widgets/custom_dashed_widget.dart';
import 'package:payment_app/core/shared_widgets/custom_divider.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_stayles.dart';
import 'package:payment_app/features/checkout/presentation/widgets/barcode_widget.dart';
import 'package:payment_app/features/checkout/presentation/widgets/credit_card_shape.dart';
import 'package:payment_app/features/checkout/presentation/widgets/left_shape_of_container.dart';
import 'package:payment_app/features/checkout/presentation/widgets/right_shape_of_container.dart';
import 'package:payment_app/features/checkout/presentation/widgets/top_done_shape_of_container.dart';
import 'package:payment_app/features/checkout/presentation/widgets/transaction_info_item.dart';
import 'package:payment_app/features/checkout/presentation/widgets/transaction_info_section.dart';

class SuccessfulPaymentViewBody extends StatelessWidget {
  const SuccessfulPaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColorWithOpacity,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 66, left: 23, right: 22),
          child: Column(children: [
            Text(
              'Thank you!',
              style: AppStyles.styleMedium25,
            ),
            Text(
              'Your transaction was successful',
              style: AppStyles.styleRegular18,
            ),
            const SizedBox(
              height: 42,
            ),
            const TransactionInfoSection(),
            const SizedBox(
              height: 30,
            ),
            const CustomDivider(indent: 0, endIndent: 0),
            const SizedBox(
              height: 24,
            ),
            TransactionInfoItem(
              title: 'Total',
              value: r'$50.97',
              style: AppStyles.styleSemiBold24,
            ),
            const SizedBox(
              height: 30,
            ),
            const CreditCardShape(),
            const SizedBox(
              height: 85,
            ),
            const BarcodeWidget(),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
      const RightShapeOfContainer(),
      const LeftShapeOfContainer(),
      const TopDoneShapeOfContainer(),
      const CustomDashedWidget(),
    ]);
  }
}
