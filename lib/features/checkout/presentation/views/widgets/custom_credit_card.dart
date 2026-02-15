import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({
    super.key,
    required this.formKey,
    required this.autovalidateMode,
  });
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
bool isCvvFocused = false, isHolderNameVisible = true;

class _CustomCreditCardState extends State<CustomCreditCard> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        CreditCardWidget(
          cardBgColor: const Color.fromARGB(255, 2, 113, 183),
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          isHolderNameVisible: isHolderNameVisible,
          onCreditCardWidgetChange:
              (creditCardBrand) {}, //true when you want to show cvv(back) view
        ),
        CreditCardForm(
          formKey: widget.formKey,
          autovalidateMode: widget.autovalidateMode,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          onCreditCardModelChange: (CreditCardModel data) {
            setState(() {
              cardNumber = data.cardNumber;
              expiryDate = data.expiryDate;
              cardHolderName = data.cardHolderName;
              cvvCode = data.cvvCode;
              isCvvFocused = data.isCvvFocused;
            });
          },
        ),
      ]),
    );
  }
}
