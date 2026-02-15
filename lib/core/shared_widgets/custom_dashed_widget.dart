import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:payment_app/core/utils/app_colors.dart';

class CustomDashedWidget extends StatelessWidget {
  const CustomDashedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.6 + 20,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Dash(
          direction: Axis.horizontal,
          length: 320,
          dashColor: AppColors.greyColor,
        ),
      ),
    );
  }
}
