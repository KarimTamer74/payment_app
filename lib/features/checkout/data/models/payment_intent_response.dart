// features/checkout/data/models/payment_intent_response.dart
class PaymentIntentResponse {
  final String? id;
  final String? object;
  final int? amount;
  final String? captureMethod;
  final String? clientSecret;
  final String? confirmationMethod;
  final int? created;
  final String? currency;
  final String? paymentMethod;
  final String? ephemeralKeySecret;

  PaymentIntentResponse({
    required this.id,
    required this.object,
    required this.amount,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.paymentMethod,
    required this.ephemeralKeySecret,
  });

  factory PaymentIntentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentIntentResponse(
      id: json['id'] as String?,
      object: json['object'] as String?,
      amount: json['amount'] as int?,
      captureMethod: json['capture_method'] as String?,
      clientSecret: json['client_secret'] as String?,
      confirmationMethod: json['confirmation_method'] as String?,
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      paymentMethod: json['payment_method'] as String?,
      ephemeralKeySecret: json['ephemeralKeySecret'] as String?,
    );
  }
}
