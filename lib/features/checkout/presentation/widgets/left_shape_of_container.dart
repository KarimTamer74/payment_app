import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';

class LeftShapeOfContainer extends StatelessWidget {
  const LeftShapeOfContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6,
      left: -20,
      child: const CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: 20,
      ),
    );
  }
}
