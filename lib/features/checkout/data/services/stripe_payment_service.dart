// features/checkout/data/services/stripe_payment_service.dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/data/models/create_cutomer_requset.dart';
import 'package:payment_app/features/checkout/data/models/create_cutomer_response.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_response.dart';

class StripePaymentService {
  final Dio _dio = Dio();

  Future<CreateCustomerResponse> createCustomer(
    CreateCutomerRequset customerInput,
  ) async {
    log("Customer Input: ${customerInput.toJson()}");

    final response = await _dio.post(
      'https://api.stripe.com/v1/customers',
      options: Options(
        headers: {'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}'},
        contentType: 'application/x-www-form-urlencoded',
      ),
      data: customerInput.toJson(),
    );

    CreateCustomerResponse createCustomerResponse =
        CreateCustomerResponse.fromJson(response.data);
    log(
      "Customer id: ${createCustomerResponse.id}",
      name: "StripePaymentService.createCustomer",
    );
    return createCustomerResponse;
  }

  Future<String> createCustomerSession(String customerId) async {
    try {
      final response = await _dio.post(
        'https://api.stripe.com/v1/customer_sessions',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
            'Stripe-Version': '2023-10-16',
          },
          contentType: Headers.formUrlEncodedContentType,
        ),
        data: {
          'customer': customerId,
          'components[mobile_payment_element][enabled]': 'true',
          'components[mobile_payment_element][features][payment_method_save]':
              'enabled',
          'components[mobile_payment_element][features][payment_method_redisplay]':
              'enabled',
          'components[mobile_payment_element][features][payment_method_remove]':
              'enabled',
        },
      );
      final customerSessionSecret = response.data['client_secret'];
      log(
        "Customer session client secret: $customerSessionSecret",
        name: "StripePaymentService.createCustomerSession",
      );
      return customerSessionSecret;
    } on DioException catch (e) {
      log("Stripe Error: ${e.response?.data}");
      rethrow;
    }
  }

  Future<PaymentIntentResponse> createPaymentIntent({
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

    return PaymentIntentResponse.fromJson(response.data);
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerId,
    required String customerSessionClientSecret,
  }) async {
    log("Customer ID: $customerId");
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        customerId: customerId,
        customerSessionClientSecret: customerSessionClientSecret,
        // Customer params
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
