import 'package:flutter/material.dart';

class CardItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CardItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CardItem> _items = {};

  get items {
    return {..._items};
  }

  get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (cardItem) => CardItem(
                id: cardItem.id,
                title: cardItem.title,
                price: cardItem.price,
                quantity: cardItem.quantity + 1,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CardItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
