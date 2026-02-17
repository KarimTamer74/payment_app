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
//! when user open app for the first time he will create a customer and save the customer id in shared preferences with the rest of user data account info
//* 1- cutomer id = customer api(email, name, etc) to create a customer and get the customer id
//* 2- customerSessionClientSecret response.data['client_secret'] = customer session api(customer id) to create a customer session and get the customer session client secret
//* 3- PayemntIntentObject= payment intent api (amount,currency as required,customer id, etc)
//! save customer id in shared preferences
//* 4- Need (customer id, payment intent client secret, customer session client secret) to init payment sheet
//! pass data from above 3 steps to payment sheet to initialize
//* 5- display payment sheet
//! display the payment sheet to the user, allowing them to enter their payment details and complete the transaction. The presentPaymentSheet method is responsible for showing the payment sheet UI to the user, where they can review their order and provide their payment information. Once the user confirms the payment, the app can handle the response accordingly, such as showing a success message or handling any errors that may occur during the payment process.
