// features/checkout/data/repos/stripe_payment_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:payment_app/core/network/failure_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_request.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_response.dart';
import 'package:payment_app/features/checkout/data/repos/stripe_payment_repo.dart';
import 'package:payment_app/features/checkout/data/services/stripe_payment_service.dart';

class StripePaymentRepoImpl implements StripePaymentRepo {
  final StripePaymentService _paymentService = StripePaymentService();

  @override
  Future<Either<Failure, PaymentIntentResponse>> createPaymentIntent({
    required PaymentIntentRequest body,
  }) async {
    try {
      final response = await _paymentService.createPaymentIntent(body: body);
      if (response.statusCode == 200) {
        return Right(PaymentIntentResponse.fromJson(response.data));
      }
      throw Failure(
        message:
            "Failed to create payment intent with error: ${response.statusMessage}",
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    try {
      await _paymentService.initPaymentSheet(
        paymentIntentClientSecret: paymentIntentClientSecret,
      );
    } catch (e) {
      throw Exception("Failed to initialize payment sheet: ${e.toString()}");
    }
  }

  @override
  Future<void> presentPaymentSheet() async {
    try {
      await _paymentService.presentPaymentSheet();
    } catch (e) {
      throw Exception("Failed to present payment sheet: ${e.toString()}");
    }
  }

  @override
  Future<Either<Failure, void>> makePayement({
    required PaymentIntentRequest body,
  }) async {
    try {
      final result = await createPaymentIntent(body: body);
      return result.fold(
        (failure) => Left(
          Failure(
            message: "Failed to create payment intent: ${failure.message}",
          ),
        ),
        (paymentIntentResponse) async {
          await initPaymentSheet(
            paymentIntentClientSecret: paymentIntentResponse.clientSecret!,
          );
          await presentPaymentSheet();
          return const Right(null);
        },
      );
    } catch (e) {
      return Left(
        Failure(message: "Failed to confirm payment: ${e.toString()}"),
      );
    }
  }
}
