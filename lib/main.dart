// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/utils/app_routes.dart';
import 'package:payment_app/features/checkout/presentation/views/my_cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  runApp(CheckoutApp(appRoutes: AppRoutes()));
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key, required this.appRoutes});
  final AppRoutes appRoutes;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyCartView(),
      onGenerateRoute: appRoutes.generateRoute,
    );
  }
}
//* 1- PayemntIntentObject= payment intent(amount,currency as required, etc)
//* 2- init pqyment sheet(payment intent client secret)
//* 3- display payment sheet by calling present method