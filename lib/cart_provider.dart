import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<CartItemData> _items = [];

  List<CartItemData> get items => _items;

  int get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void updatePatients(int index, int patients) {
    _items[index].patients = patients;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void toggleItem(CartItemData item) {
    final index = _items.indexWhere((i) => i.title == item.title);
    if (index != -1) {
      _items.removeAt(index);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }
}

class CartItemData {
  final String title;
  final int price;
  int patients;

  CartItemData({
    required this.title,
    required this.price,
    required this.patients,
  });

  int get totalPrice => price * patients;
}