// features/checkout/data/models/payment_intent_request.dart
class PaymentIntentRequest {
  final int amount;
  final String currency;
  final String? customer;
  final bool? confirm;
  final Map<String, dynamic>? automaticPaymentMethods;
  PaymentIntentRequest({
    required this.amount,
    required this.currency,
    this.customer,
    this.confirm = false,
    this.automaticPaymentMethods,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': (amount * 100),
      'currency': currency,
      'customer': customer,
      'confirm': confirm,
      'automatic_payment_methods': automaticPaymentMethods,
    };
  }

  PaymentIntentRequest copyWith({
    int? amount,
    String? currency,
    String? customer,
    bool? confirm,
    Map<String, dynamic>? automaticPaymentMethods,
  }) {
    return PaymentIntentRequest(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      customer: customer ?? this.customer,
      confirm: confirm ?? this.confirm,
      automaticPaymentMethods:
          automaticPaymentMethods ?? this.automaticPaymentMethods,
    );
  }
}
