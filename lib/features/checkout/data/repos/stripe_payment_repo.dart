// features/checkout/data/repos/stripe_payment_repo.dart
import 'package:dartz/dartz.dart';
import 'package:payment_app/core/network/failure_model.dart';
import 'package:payment_app/features/checkout/data/models/payment_intent_request.dart';

abstract class StripePaymentRepo {
  // Future<CreateCustomerResponse> createCustomer({
  //   required CreateCutomerRequset body,
  // });

  // Future createCustomerSession(String customerId);
  // Future<Either<Failure, PaymentIntentResponse>> createPaymentIntent({
  //   required PaymentIntentRequest body,
  // });

  // Future<void> initPaymentSheet({
  //   required String paymentIntentClientSecret,
  //   required String customerId,
  //   required String customerSessionClientSecret,
  // });

  // Future<void> presentPaymentSheet();
  Future<Either<Failure, void>> makePayement({
    required PaymentIntentRequest body,
  });
}
