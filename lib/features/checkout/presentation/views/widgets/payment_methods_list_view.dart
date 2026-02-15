import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_colors.dart';
import 'package:payment_app/core/utils/constants.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key, this.onTap});
  final Function(int)? onTap; // تعديل التابع ليقبل قيمة int

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  static const List<String> paymentMethodsImages = [
    cardImage,
    paypalImage,
    applePayImage
  ];

  int selecedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsImages.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selecedIndex = index;
              });
              widget.onTap?.call(index);
             
            },
            splashColor: AppColors.whiteColor,
            child: PaymentMethodItem(
              isSelected: selecedIndex == index,
              image: paymentMethodsImages[index],
            ),
          );
        },
      ),
    );
  }
}
