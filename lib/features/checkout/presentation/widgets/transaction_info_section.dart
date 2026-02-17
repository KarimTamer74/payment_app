// features/checkout/presentation/widgets/transaction_info_section.dart
import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/widgets/transaction_info_item.dart';

class TransactionInfoSection extends StatelessWidget {
  const TransactionInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [  TransactionInfoItem(title: 'Date', value: '01/24/2023'),
                       SizedBox(
                        height: 20,
                      ),
                       TransactionInfoItem(title: 'Time', value: '10:15 AM'),
                       SizedBox(
                        height: 20,
                      ),
                       TransactionInfoItem(title: 'To', value: 'Sam Louis'),],);
  }
}