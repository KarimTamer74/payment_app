import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/app_stayles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.textButton, this.onPressed});
  final String textButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor,
        minimumSize: const Size(double.infinity, 73),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      child: Text(
        textButton,
        style: AppStyles.styleMedium22,
      ),
    );
  }
}
