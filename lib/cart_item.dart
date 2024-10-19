// cart_item.dart
import 'clothes.dart'; // Импортируем модель одежды

class CartItem extends Clothing {
  int quantity; // Количество товара

  CartItem({
    required String name,
    required String imageUrl,
    required double price,
    this.quantity = 1, // По умолчанию количество равно 1
  }) : super(name: name, imageUrl: imageUrl, price: price);
}
