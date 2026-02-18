// features/checkout/data/models/paypal_models/transactions_model.dart
import 'package:payment_app/features/checkout/data/models/paypal_models/amount_model.dart';
import 'package:payment_app/features/checkout/data/models/paypal_models/item_list_model.dart';

class TransactionsModel {
  final AmountModel amount;
  final String description;
  final ItemListModel itemList;

  TransactionsModel({
    required this.amount,
    required this.description,
    required this.itemList,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': amount.toMap(),
      'description': description,
      'item_list': itemList.toMap(),
    };
  }
}
