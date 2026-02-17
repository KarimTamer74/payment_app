
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_stayles.dart';
import 'package:payment_app/core/utils/constants.dart';

class BarcodeWidget extends StatelessWidget {
  const BarcodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          carrierIcon,
          height: 71,
        ),
        Container(
          width: 113,
          height: 58,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border:
                  Border.all(width: 1.5, color: AppColors.greenColor)),
          child: Center(
            child: Text(
              'Paid',
              style: AppStyles.styleSemiBold24
                  .copyWith(color: AppColors.greenColor),
            ),
          ),
        )
      ],
    );
  }
}

