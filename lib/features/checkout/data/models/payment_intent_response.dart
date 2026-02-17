// features/checkout/data/models/payment_intent_response.dart
class PaymentIntentResponse {
  String? id;
  String? object;
  int? amount;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  String? paymentMethod;

  PaymentIntentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    captureMethod = json['capture_method'];
    clientSecret = json['client_secret'];
    confirmationMethod = json['confirmation_method'];
    created = json['created'];
    currency = json['currency'];
    paymentMethod = json['payment_method'];
  }
}
