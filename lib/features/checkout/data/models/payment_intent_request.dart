// features/checkout/data/models/payment_intent_request.dart
class PaymentIntentRequest {
  final int amount;
  final String currency;
  final String? customer;
  final bool? confirm;
  PaymentIntentRequest({
    required this.amount,
    required this.currency,
     this.customer,
    this.confirm = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': (amount * 100),
      'currency': currency,
      'customer': customer,
      'confirm': confirm,
    };
  }

  PaymentIntentRequest copyWith({
    int? amount,
    String? currency,
    String? customer,
    bool? confirm,
  }) {
    return PaymentIntentRequest(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      customer: customer ?? this.customer,
      confirm: confirm ?? this.confirm,
    );
  }
}
