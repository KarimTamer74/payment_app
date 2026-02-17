import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_app/core/utils/app_colors.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.isSelected, required this.image});
  final bool isSelected;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 62,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Card(
          color: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
                color: isSelected ? AppColors.greenColor : AppColors.greyColor,
                width: 1.5),
          ),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}
