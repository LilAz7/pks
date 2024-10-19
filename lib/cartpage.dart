// cartpage.dart
import 'package:flutter/material.dart';
import 'cart_item.dart'; // Импортируем модель корзины

class CartScreen extends StatelessWidget {
  final List<CartItem> cartItems; // Список товаров в корзине
  final void Function(CartItem) onRemove; // Callback для удаления товара
  final void Function(CartItem, int) onQuantityChange; // Callback для изменения количества

  CartScreen({required this.cartItems, required this.onRemove, required this.onQuantityChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Корзина пуста'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item.imageUrl),
                  title: Text(item.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Цена: ${item.price} руб.'),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              onQuantityChange(item, item.quantity - 1);
                            },
                          ),
                          Text('${item.quantity}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              onQuantityChange(item, item.quantity + 1);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => onRemove(item),
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
      'Итого: ${cartItems.fold(0.0, (total, item) => total + (item.price * item.quantity))} руб.',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

    );
  }
}
