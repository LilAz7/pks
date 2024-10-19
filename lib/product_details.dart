// product_details.dart

import 'package:flutter/material.dart';
import 'clothes.dart'; // Модель одежды

class ProductDetails extends StatelessWidget {
  final Clothing clothing;

  ProductDetails({required this.clothing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(clothing.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Центрируем содержимое
          children: [
            Center(
              child: Image.network(
                clothing.imageUrl,
                height: 250,
              ),
            ),
            const SizedBox(height: 24),
            Center( // Обернули в Center для выравнивания по центру
              child: Text(
                clothing.name,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Центрируем текст
              ),
            ),
            const SizedBox(height: 16),
            Center( // Обернули в Center для выравнивания по центру
              child: Text(
                '${clothing.price} ₽',
                style: const TextStyle(fontSize: 24, color: Colors.green),
                textAlign: TextAlign.center, // Центрируем текст
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Обработка покупки
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Товар куплен!')),
                  );
                },
                child: const Text('Купить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
