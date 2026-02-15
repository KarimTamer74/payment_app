import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';

abstract class AppStyles {
  static TextStyle styleRegular16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: AppColors.blackColor.withOpacity(0.7));
  static TextStyle styleRegular18 = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      color: AppColors.blackColor);
  static TextStyle styleRegular20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static TextStyle styleMedium12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );
  static TextStyle styleMedium22 = const TextStyle(
    fontSize: 22,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
    // fontFamily: 'Inter',
  );
  static TextStyle styleMedium25 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    // fontFamily: 'Inter',
  );

  static TextStyle styleSemiBold18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
  static TextStyle styleSemiBold20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
  static TextStyle styleSemiBold24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
    fontFamily: 'Inter',
  );
}
