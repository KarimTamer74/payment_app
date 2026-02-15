import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/constants.dart';

class TopDoneShapeOfContainer extends StatelessWidget {
  const TopDoneShapeOfContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -50,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: 50,
        backgroundColor: AppColors.whiteColorWithOpacity,
        child: Image.network(width: 80, height: 80, doneIcon),
      ),
    );
  }
}
