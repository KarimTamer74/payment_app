import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/app_routes.dart';
import 'package:payment_app/features/checkout/presentation/views/my_cart_view.dart';

void main() {
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
