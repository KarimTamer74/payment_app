// features/checkout/data/repos/stripe_payment_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:payment_app/core/network/failure_model.dart';
import 'package:payment_app/features/checkout/data/models/create_cutomer_requset.dart';
import 'package:payment_app/features/checkout/data/models/create_cutomer_response.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment_app/features/checkout/data/repos/stripe_payment_repo.dart';
import 'package:payment_app/features/checkout/data/services/stripe_payment_service.dart';

class StripePaymentRepoImpl implements StripePaymentRepo {
  final StripePaymentService _paymentService = StripePaymentService();

  // @override
  // Future<CreateCustomerResponse> createCustomer({
  //   required CreateCutomerRequset body,
  // }) async {
  //   try {
  //     final response = await _paymentService.createCustomer(body);
  //     if (response.statusCode == 200) {
  //       return CreateCustomerResponse.fromJson(response.data);
  //     }
  //     throw Failure(
  //       message:
  //           "Failed to create customer with error: ${response.statusMessage}",
  //     );
  //   } catch (e) {
  //     throw Failure(message: e.toString());
  //   }
  // }

  // @override
  // Future<dynamic> createCustomerSession(String customerId) {
  //   try {
  //     return _paymentService.createCustomerSession(customerId);
  //   } catch (e) {
  //     throw Failure(message: e.toString());
  //   }
  // }

  // @override
  // Future<Either<Failure, PaymentIntentResponse>> createPaymentIntent({
  //   required PaymentIntentRequest body,
  // }) async {
  //   try {
  //     log(
  //       "Creating payment intent with body: ${body.toJson()}",
  //       name: "StripePaymentRepoImpl.createPaymentIntent",
  //     );
  //     final response = await _paymentService.createPaymentIntent(body: body);
  //     if (response.statusCode == 200) {
  //       return Right(PaymentIntentResponse.fromJson(response.data));
  //     }
  //     throw Failure(
  //       message:
  //           "Failed to create payment intent with error: ${response.statusMessage}",
  //     );
  //   } catch (e) {
  //     return Left(Failure(message: e.toString()));
  //   }
  // }

  // @override
  // Future<void> initPaymentSheet({
  //   required String paymentIntentClientSecret,
  //   required String customerId,
  //   required String customerSessionClientSecret,
  // }) async {
  //   try {
  //     await _paymentService.initPaymentSheet(
  //       paymentIntentClientSecret: paymentIntentClientSecret,
  //       customerId: customerId,
  //       customerSessionClientSecret: customerSessionClientSecret,
  //     );
  //   } catch (e) {
  //     throw Exception("Failed to initialize payment sheet: ${e.toString()}");
  //   }
  // }

  // @override
  // Future<void> presentPaymentSheet() async {
  //   try {
  //     await _paymentService.presentPaymentSheet();
  //   } catch (e) {
  //     throw Exception("Failed to present payment sheet: ${e.toString()}");
  //   }
  // }

  @override
  Future<Either<Failure, void>> makePayement({
    required PaymentIntentRequest body,
  }) async {
    try {
      /// 1️⃣ Create Customer
      // final CreateCustomerResponse customerResponse = await _paymentService
      //     .createCustomer(
      //       CreateCutomerRequset(
      //         email: "3k0eF@example.com",
      //         name: "John Doe",
      //         phone: "1234567890",
      //       ),
      //     );
      const customerId = "cus_TzpNqr1S5izxnY";

      /// 2️⃣ Create Customer Session
      final customerSessionSecret = await _paymentService.createCustomerSession(
        customerId,
      );

      /// 3️⃣ Create Payment Intent
      final paymentIntentResult = await _paymentService.createPaymentIntent(
        body: body.copyWith(customer: customerId),
      );

      /// 4️⃣ Init Payment Sheet
      await _paymentService.initPaymentSheet(
        paymentIntentClientSecret: paymentIntentResult.clientSecret!,
        customerId: customerId,
        customerSessionClientSecret: customerSessionSecret,
      );

      /// 5️⃣ Present Payment Sheet
      await _paymentService.presentPaymentSheet();

      return const Right(null);
    } catch (e) {
      return Left(Failure(message: "Payment failed: ${e.toString()}"));
    }
  }
}
