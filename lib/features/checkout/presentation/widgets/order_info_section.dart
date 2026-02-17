// features/checkout/presentation/widgets/order_info_section.dart
import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/widgets/order_info_item.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         OrderInfoItem(
          title: 'Order Subtotal',
          value: '\$42.97',
        ),
         OrderInfoItem(
          title: 'Discount',
          value: '\$0',
        ),
         OrderInfoItem(
          title: 'Shipping',
          value: '\$8',
        ),
      ],
    );
  }
}
