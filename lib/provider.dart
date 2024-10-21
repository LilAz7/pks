import 'package:flutter/material.dart';

class CartItemData {
  final String id;
  final String title;
  final int price;
  int patients;

  CartItemData({
    required this.id,
    required this.title,
    required this.price,
    required this.patients,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItemData> _items = [];

  List<CartItemData> get items => _items;

  int get totalPrice => _items.fold(0, (total, item) => total + (item.price * item.patients));

  void toggleItem(CartItemData item) {
    final existingItemIndex = _items.indexWhere((i) => i.title == item.title);
    if (existingItemIndex >= 0) {
      _items.removeAt(existingItemIndex);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void updatePatients(int index, int patients) {
    _items[index].patients = patients;
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
