import 'package:flutter/material.dart';
import 'package:payment_app/core/shared_widgets/custom_button.dart';
import 'package:payment_app/core/utils/constants.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:payment_app/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  int currentIndex = 0;
  PageController? _pageController;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void updateSelectedIndex(int index) {
    setState(
      () {
        currentIndex = index;
        if (index == 0) {
          _pageController = PageController();
        } else {
          _pageController = null;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: 50),
        ),
        SliverToBoxAdapter(
            child: PaymentMethodsListView(onTap: updateSelectedIndex)),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),

        currentIndex == 0
            ? CustomCreditCard(
                formKey: formKey,
                autovalidateMode: autovalidateMode,
              )
            : SliverToBoxAdapter(
                child: Container(
                  color: Colors.amber,
                  height: 200,
                  width: double.infinity,
                ),
              ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverFillRemaining(
          child: Align(
            alignment: Alignment.center,
            child: CustomButton(
              textButton: "Pay Now",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.pushNamed(context, paymentSuccess);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 12),
        ),
      ],
    );
  }
}
