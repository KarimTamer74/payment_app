// features/checkout/data/models/paypal_models/amount_model.dart
class AmountModel {
  final String total;
  final String currency;
  final DetailsModel details;

  const AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {'total': total, 'currency': currency, 'details': details.toMap()};
  }
}

class DetailsModel {
  final String subtotal;
  final String shipping;
  final int? shippingDiscount;

const  DetailsModel({
    required this.subtotal,
    required this.shipping,
    this.shippingDiscount,
  });

  Map<String, dynamic> toMap() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'shipping_discount': shippingDiscount,
    };
  }
}
