// features/checkout/presentation/cubits/stripe_payment_cubit/stripe_payment_states.dart
abstract class StripePaymentState {}

class StripePaymentInitial extends StripePaymentState {}

class StripePaymentLoading extends StripePaymentState {}

class StripePaymentSuccess extends StripePaymentState {}

class StripePaymentFailure extends StripePaymentState {
  final String message;
  StripePaymentFailure({required this.message});
}