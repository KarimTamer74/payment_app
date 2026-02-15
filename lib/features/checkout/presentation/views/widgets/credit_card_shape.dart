import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_stayles.dart';
import 'package:payment_app/core/utils/constants.dart';

class CreditCardShape extends StatelessWidget {
  const CreditCardShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: BoxDecoration(
          color: AppColors.whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.only(left: 23.0),
        child: Row(
          children: [
            SvgPicture.asset(creditCardLogo),
            const SizedBox(
              width: 15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Credit Card\n', style: AppStyles.styleRegular18),
                  TextSpan(
                      text: 'Mastercard **78', style: AppStyles.styleRegular16)
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
