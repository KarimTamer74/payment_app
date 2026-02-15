import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_dots.dart';

class CreditCardPageView extends StatelessWidget {
  const CreditCardPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            itemCount: 3,
            itemBuilder: (context, itemIndex) {
              return Image.asset(
                'assets/images/credit_card.png', 
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        CustomDots(pageController: pageController),
      ],
    );
  }
}
