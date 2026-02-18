// features/checkout/data/models/paypal_models/item_list_model.dart
class ItemListModel {
  final List<ItemModel> items;

  const ItemListModel({required this.items});

  Map<String, dynamic> toMap() {
    return {'items': items.map((item) => item.toMap()).toList()};
  }
}

class ItemModel {
  final String name;
  final int quantity;
  final String price;
  final String currency;

  const ItemModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'currency': currency,
    };
  }
}
