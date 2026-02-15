import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_stayles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem(
      {super.key, required this.title, required this.value, this.style});
  final String title;
  final String value;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: style ?? AppStyles.styleRegular18,
          ),
          Text(
            value,
            style: style ?? AppStyles.styleRegular18,
          ),
        ],
      ),
    );
  }
}
