// features/checkout/data/services/stripe_payment_service.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_request.dart';

class StripePaymentService {
  final Dio _dio = Dio();

  Future<Response> createPaymentIntent({
    required PaymentIntentRequest body,
  }) async {
    log("Body: ${body.toJson()}");
    final Response response = await _dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: body.toJson(),
    );
    log(
      "Response: ${response.data}",
      name: "PaymentService.createPaymentIntent",
    );

    return response;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerId,
  }) async {
    BillingDetails billingDetails = BillingDetails(
      email: 'example@gmail.com',
      phone: '+201148779202',
      name: 'Karim Tamer',
    );

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        billingDetails: billingDetails,
      ),
    );
    log(
      "Payment sheet initialized successfully",
      name: "PaymentService.initPaymentSheet",
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
    log(
      "Payment sheet presented successfully",
      name: "PaymentService.presentPaymentSheet",
    );
  }
}
