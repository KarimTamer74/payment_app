import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';

class RightShapeOfContainer extends StatelessWidget {
  const RightShapeOfContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6,
      right: -20,
      child: const CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: 20,
      ),
    );
  }
}
